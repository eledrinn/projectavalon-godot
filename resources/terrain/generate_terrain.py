# Native Starter Terrain Generation Script
# Project Avalon | Environment Pipeline
# Generates heightmap and splatmap for Terrain3D workflow

import numpy as np
from PIL import Image
import os

# ============================================================================
# CONFIGURATION
# ============================================================================

# Output paths
OUTPUT_DIR = "resources/terrain"
HEIGHTMAP_PATH = os.path.join(OUTPUT_DIR, "native_starter_height.png")
SPLATMAP_PATH = os.path.join(OUTPUT_DIR, "native_starter_splat.png")

# Terrain dimensions (higher detail: 513x385, or use 201x151 for 1:1 meter)
WIDTH = 513  # X-axis (West to East)
HEIGHT = 385  # Z-axis (South to North)

# World scale
WORLD_WIDTH = 200.0  # meters
WORLD_DEPTH = 150.0  # meters

# Elevation range (meters)
MIN_ELEVATION = -5.0  # Breathing Holes depression
MAX_ELEVATION = 8.0   # Waymarker Vista
BASELINE = 0.0        # Wetland water level

# Key landmark coordinates (normalized 0-1)
LANDMARKS = {
    "hearthroot": {"x": 0.25, "z": 0.5, "elevation": 0.0, "radius": 0.08},
    "shellmound": {"x": 0.65, "z": 0.5, "elevation": 2.0, "radius": 0.06},
    "breathing_holes": {"x": 0.70, "z": 0.63, "elevation": -5.0, "radius": 0.10},
    "woven_arch": {"x": 0.55, "z": 0.70, "elevation": 2.5, "radius": 0.05},
    "tier2_ledge": {"x": 0.45, "z": 0.57, "elevation": 4.0, "radius": 0.04},
    "waymarker": {"x": 0.90, "z": 0.5, "elevation": 8.0, "radius": 0.05},
}

# ============================================================================
# HEIGHTMAP GENERATION
# ============================================================================

def generate_heightmap():
    """Generate 16-bit grayscale heightmap PNG."""
    
    # Create base terrain (flat wetland baseline)
    terrain = np.ones((HEIGHT, WIDTH), dtype=np.float32) * BASELINE
    
    # Create coordinate grids
    x = np.linspace(0, 1, WIDTH)
    z = np.linspace(0, 1, HEIGHT)
    X, Z = np.meshgrid(x, z)
    
    # === Apply landmark elevations using smooth radial gradients ===
    
    # 1. Hearthroot - gentle rise with root system
    hx, hz = LANDMARKS["hearthroot"]["x"], LANDMARKS["hearthroot"]["z"]
    hr = LANDMARKS["hearthroot"]["radius"]
    dist_hr = np.sqrt((X - hx)**2 + (Z - hz)**2)
    hearthroot_elevation = 2.0 * np.exp(-dist_hr**2 / (2 * hr**2))
    terrain += hearthroot_elevation
    
    # 2. Shellmound - distinct mounded area
    sx, sz = LANDMARKS["shellmound"]["x"], LANDMARKS["shellmound"]["z"]
    sr = LANDMARKS["shellmound"]["radius"]
    dist_sm = np.sqrt((X - sx)**2 + (Z - sz)**2)
    shellmound_elevation = 2.0 * (1 - np.clip(dist_sm / sr, 0, 1)**2)
    terrain = np.maximum(terrain, shellmound_elevation)
    
    # 3. Breathing Holes - depression with bowl shape
    bx, bz = LANDMARKS["breathing_holes"]["x"], LANDMARKS["breathing_holes"]["z"]
    br = LANDMARKS["breathing_holes"]["radius"]
    dist_bh = np.sqrt((X - bx)**2 + (Z - bz)**2)
    depression = -5.0 * np.exp(-dist_bh**2 / (2 * (br/2)**2))
    terrain += depression
    
    # 4. Woven Arch - gentle rise to archway
    wx, wz = LANDMARKS["woven_arch"]["x"], LANDMARKS["woven_arch"]["z"]
    wr = LANDMARKS["woven_arch"]["radius"]
    dist_wa = np.sqrt((X - wx)**2 + (Z - wz)**2)
    arch_elevation = 2.5 * np.exp(-dist_wa**2 / (2 * wr**2))
    terrain += arch_elevation
    
    # 5. Tier 2 Ledge - mid-climb plateau
    tx, tz = LANDMARKS["tier2_ledge"]["x"], LANDMARKS["tier2_ledge"]["z"]
    tr = LANDMARKS["tier2_ledge"]["radius"]
    dist_t2 = np.sqrt((X - tx)**2 + (Z - tz)**2)
    ledge_elevation = 4.0 * np.exp(-dist_t2**2 / (2 * tr**2))
    terrain += ledge_elevation
    
    # 6. Waymarker Vista - highest elevation (ridge extending from east)
    vx, vz = LANDMARKS["waymarker"]["x"], LANDMARKS["waymarker"]["z"]
    vr = LANDMARKS["waymarker"]["radius"]
    dist_wm = np.sqrt((X - vx)**2 + (Z - vz)**2)
    # Create ridge extending west from Waymarker
    ridge_factor = np.exp(-((Z - vz)**2) / (2 * 0.15**2))  # Wide north-south ridge
    ridge_elevation = 8.0 * np.exp(-dist_wm**2 / (2 * vr**2)) * (1 + 0.5 * ridge_factor)
    terrain = np.maximum(terrain, ridge_elevation)
    
    # === Add subtle noise for natural variation ===
    np.random.seed(42)  # Reproducible
    noise = np.random.normal(0, 0.1, terrain.shape)
    terrain += noise
    
    # === Smooth transitions with Gaussian filter ===
    from scipy.ndimage import gaussian_filter
    terrain = gaussian_filter(terrain, sigma=1.5)
    
    # === Normalize to 16-bit range (0-65535) ===
    # Map -5m to 0, +8m to 65535
    min_h, max_h = MIN_ELEVATION, MAX_ELEVATION
    normalized = (terrain - min_h) / (max_h - min_h)
    normalized = np.clip(normalized, 0, 1)
    heightmap_16bit = (normalized * 65535).astype(np.uint16)
    
    # === Save as PNG ===
    os.makedirs(OUTPUT_DIR, exist_ok=True)
    img = Image.fromarray(heightmap_16bit, mode='I;16')
    img.save(HEIGHTMAP_PATH)
    
    print(f"✓ Heightmap generated: {HEIGHTMAP_PATH}")
    print(f"  Size: {WIDTH}x{HEIGHT} pixels")
    print(f"  Elevation range: {terrain.min():.1f}m to {terrain.max():.1f}m")
    
    return terrain

# ============================================================================
# SPLATMAP GENERATION
# ============================================================================

def generate_splatmap():
    """Generate RGBA splatmap for biome distribution."""
    
    # Create coordinate grids
    x = np.linspace(0, 1, WIDTH)
    z = np.linspace(0, 1, HEIGHT)
    X, Z = np.meshgrid(x, z)
    
    # Initialize channels (R= Wetland, G= Grass, B= Fungal, A= Rock)
    wetland = np.zeros((HEIGHT, WIDTH), dtype=np.float32)    # R
    grass = np.zeros((HEIGHT, WIDTH), dtype=np.float32)      # G
    fungal = np.zeros((HEIGHT, WIDTH), dtype=np.float32)     # B
    rock = np.zeros((HEIGHT, WIDTH), dtype=np.float32)       # A
    
    # === 1. WETLAND (R) - 40% of area ===
    # Base wetland coverage: low-lying areas, especially south and around breathing holes
    bx, bz = LANDMARKS["breathing_holes"]["x"], LANDMARKS["breathing_holes"]["z"]
    br = LANDMARKS["breathing_holes"]["radius"]
    dist_bh = np.sqrt((X - bx)**2 + (Z - bz)**2)
    
    # Strong wetland around Breathing Holes
    wetland += 1.0 * np.exp(-dist_bh**2 / (2 * br**2))
    # General wetland in lower elevations (south half)
    wetland += 0.6 * (1 - Z)  # More wetland in south
    # Wetland around Hearthroot (spawn area)
    hx, hz = LANDMARKS["hearthroot"]["x"], LANDMARKS["hearthroot"]["z"]
    dist_hr = np.sqrt((X - hx)**2 + (Z - hz)**2)
    wetland += 0.4 * np.exp(-dist_hr**2 / (2 * 0.1**2))
    
    # === 2. GRASS (G) - 30% of area ===
    # Grass in middle elevations and paths
    # Around Shellmound (quest hub)
    sx, sz = LANDMARKS["shellmound"]["x"], LANDMARKS["shellmound"]["z"]
    sr = LANDMARKS["shellmound"]["radius"]
    dist_sm = np.sqrt((X - sx)**2 + (Z - sz)**2)
    grass += 0.8 * np.exp(-dist_sm**2 / (2 * (sr*1.5)**2))
    
    # General grass coverage in central area
    grass += 0.4 * np.exp(-((X - 0.5)**2 + (Z - 0.5)**2) / (2 * 0.2**2))
    
    # === 3. FUNGAL (B) - 20% of area ===
    # Fungal growth concentrated around Shellmound (ring)
    fungal_ring = np.exp(-(dist_sm - sr)**2 / (2 * (sr*0.5)**2))
    fungal += 0.9 * fungal_ring
    
    # Fungal near Woven Arch (ancient, mysterious)
    wx, wz = LANDMARKS["woven_arch"]["x"], LANDMARKS["woven_arch"]["z"]
    dist_wa = np.sqrt((X - wx)**2 + (Z - wz)**2)
    fungal += 0.5 * np.exp(-dist_wa**2 / (2 * 0.08**2))
    
    # === 4. ROCK (A) - 10% of area ===
    # Rock at high elevations (Waymarker Vista and climb)
    vx, vz = LANDMARKS["waymarker"]["x"], LANDMARKS["waymarker"]["z"]
    vr = LANDMARKS["waymarker"]["radius"]
    dist_wm = np.sqrt((X - vx)**2 + (Z - vz)**2)
    
    # Rock ridge extending from Waymarker
    rock_ridge = np.exp(-((Z - vz)**2) / (2 * 0.12**2))
    rock += 0.9 * np.exp(-dist_wm**2 / (2 * (vr*2)**2)) * rock_ridge
    
    # Rocky outcrops on Tier 2 Ledge
    tx, tz = LANDMARKS["tier2_ledge"]["x"], LANDMARKS["tier2_ledge"]["z"]
    dist_t2 = np.sqrt((X - tx)**2 + (Z - tz)**2)
    rock += 0.4 * np.exp(-dist_t2**2 / (2 * 0.05**2))
    
    # === Normalize so channels sum to 1 (per pixel) ===
    total = wetland + grass + fungal + rock
    # Avoid division by zero
    total = np.where(total < 0.001, 1, total)
    
    wetland = wetland / total
    grass = grass / total
    fungal = fungal / total
    rock = rock / total
    
    # === Scale to 8-bit (0-255) ===
    wetland_8bit = (wetland * 255).astype(np.uint8)
    grass_8bit = (grass * 255).astype(np.uint8)
    fungal_8bit = (fungal * 255).astype(np.uint8)
    rock_8bit = (rock * 255).astype(np.uint8)
    
    # === Stack into RGBA ===
    splatmap = np.stack([wetland_8bit, grass_8bit, fungal_8bit, rock_8bit], axis=-1)
    
    # === Save as PNG ===
    img = Image.fromarray(splatmap, mode='RGBA')
    img.save(SPLATMAP_PATH)
    
    print(f"✓ Splatmap generated: {SPLATMAP_PATH}")
    print(f"  Size: {WIDTH}x{HEIGHT} pixels")
    print(f"  Channels: R=Wetland, G=Grass, B=Fungal, A=Rock")
    print(f"  Approximate distribution:")
    print(f"    - Wetland (R): {wetland.mean()*100:.1f}%")
    print(f"    - Grass (G): {grass.mean()*100:.1f}%")
    print(f"    - Fungal (B): {fungal.mean()*100:.1f}%")
    print(f"    - Rock (A): {rock.mean()*100:.1f}%")
    
    return splatmap

# ============================================================================
# MAIN
# ============================================================================

if __name__ == "__main__":
    print("=" * 60)
    print("Project Avalon - Native Starter Terrain Generator")
    print("=" * 60)
    
    try:
        terrain = generate_heightmap()
        splatmap = generate_splatmap()
        print("\n" + "=" * 60)
        print("✓ Generation complete!")
        print(f"✓ Output directory: {OUTPUT_DIR}")
        print("=" * 60)
    except ImportError as e:
        print(f"\n✗ Error: Missing dependency - {e}")
        print("  Install required packages: pip install numpy pillow scipy")
    except Exception as e:
        print(f"\n✗ Error during generation: {e}")
        import traceback
        traceback.print_exc()
