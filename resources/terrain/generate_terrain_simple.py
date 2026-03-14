# Native Starter Terrain Generation Script (Simple Version)
# No scipy dependency - uses numpy only

import numpy as np
from PIL import Image
import os

OUTPUT_DIR = "resources/terrain"
HEIGHTMAP_PATH = os.path.join(OUTPUT_DIR, "native_starter_height.png")
SPLATMAP_PATH = os.path.join(OUTPUT_DIR, "native_starter_splat.png")

WIDTH = 513
HEIGHT = 385
MIN_ELEVATION = -5.0
MAX_ELEVATION = 8.0

def gaussian_blur_simple(arr, sigma=2):
    """Simple Gaussian blur using numpy only (no scipy)."""
    from numpy.lib.stride_tricks import sliding_window_view
    # Simple box blur for smoothing
    kernel_size = int(sigma * 3) * 2 + 1
    if kernel_size < 3:
        kernel_size = 3
    
    pad = kernel_size // 2
    padded = np.pad(arr, pad, mode='edge')
    
    result = np.zeros_like(arr)
    for i in range(kernel_size):
        for j in range(kernel_size):
            result += padded[i:i+arr.shape[0], j:j+arr.shape[1]]
    
    return result / (kernel_size * kernel_size)

def generate_heightmap():
    """Generate 16-bit grayscale heightmap."""
    
    # Start with baseline
    terrain = np.zeros((HEIGHT, WIDTH), dtype=np.float32)
    
    x = np.linspace(0, 1, WIDTH)
    z = np.linspace(0, 1, HEIGHT)
    X, Z = np.meshgrid(x, z)
    
    # Hearthroot - gentle mound at 0, 0.5
    dist_hr = np.sqrt((X - 0.25)**2 + (Z - 0.5)**2)
    terrain += 1.5 * np.exp(-dist_hr**2 / 0.02)
    
    # Shellmound - distinct mound at 0.65, 0.5
    dist_sm = np.sqrt((X - 0.65)**2 + (Z - 0.5)**2)
    terrain = np.maximum(terrain, 2.0 * (1 - np.clip(dist_sm / 0.08, 0, 1)))
    
    # Breathing Holes - DEEP depression at 0.70, 0.63
    dist_bh = np.sqrt((X - 0.70)**2 + (Z - 0.63)**2)
    depression = -4.0 * np.exp(-dist_bh**2 / 0.008)
    terrain += depression
    
    # Waymarker Vista - HIGH elevation at 0.90, 0.5
    dist_wm = np.sqrt((X - 0.90)**2 + (Z - 0.5)**2)
    terrain = np.maximum(terrain, 7.0 * (1 - np.clip(dist_wm / 0.12, 0, 1)))
    
    # Smooth
    terrain = gaussian_blur_simple(terrain, 2)
    
    # Normalize to 0-65535 (16-bit)
    terrain_min, terrain_max = terrain.min(), terrain.max()
    print(f"Terrain range before normalize: {terrain_min:.1f} to {terrain_max:.1f}")
    
    # Map -5 to 8 range
    normalized = (terrain - MIN_ELEVATION) / (MAX_ELEVATION - MIN_ELEVATION)
    normalized = np.clip(normalized, 0, 1)
    heightmap_16bit = (normalized * 65535).astype(np.uint16)
    
    # Save
    os.makedirs(OUTPUT_DIR, exist_ok=True)
    img = Image.fromarray(heightmap_16bit, mode='I;16')
    img.save(HEIGHTMAP_PATH)
    
    print(f"✓ Heightmap: {HEIGHTMAP_PATH}")
    print(f"  Elevation range: {terrain_min:.1f}m to {terrain_max:.1f}m")
    
    return terrain

def generate_splatmap():
    """Generate RGBA splatmap."""
    
    x = np.linspace(0, 1, WIDTH)
    z = np.linspace(0, 1, HEIGHT)
    X, Z = np.meshgrid(x, z)
    
    # Channels
    wetland = np.zeros((HEIGHT, WIDTH), dtype=np.float32)
    grass = np.zeros((HEIGHT, WIDTH), dtype=np.float32)
    fungal = np.zeros((HEIGHT, WIDTH), dtype=np.float32)
    rock = np.zeros((HEIGHT, WIDTH), dtype=np.float32)
    
    # Wetland - around breathing holes + south
    dist_bh = np.sqrt((X - 0.70)**2 + (Z - 0.63)**2)
    wetland += np.exp(-dist_bh**2 / 0.02)
    wetland += 0.5 * (1 - Z)  # South = more wetland
    
    # Grass - around Shellmound
    dist_sm = np.sqrt((X - 0.65)**2 + (Z - 0.5)**2)
    grass += 0.8 * np.exp(-dist_sm**2 / 0.03)
    grass += 0.3  # Base grass
    
    # Fungal - ring around Shellmound
    fungal += 0.9 * np.exp(-(dist_sm - 0.08)**2 / 0.005)
    
    # Rock - high elevation (Waymarker)
    dist_wm = np.sqrt((X - 0.90)**2 + (Z - 0.5)**2)
    rock += np.exp(-dist_wm**2 / 0.03)
    
    # Normalize
    total = wetland + grass + fungal + rock
    total = np.maximum(total, 0.001)
    wetland /= total
    grass /= total
    fungal /= total
    rock /= total
    
    # Stack RGBA
    splatmap = np.stack([
        (wetland * 255).astype(np.uint8),
        (grass * 255).astype(np.uint8),
        (fungal * 255).astype(np.uint8),
        (rock * 255).astype(np.uint8)
    ], axis=-1)
    
    img = Image.fromarray(splatmap, mode='RGBA')
    img.save(SPLATMAP_PATH)
    
    print(f"✓ Splatmap: {SPLATMAP_PATH}")
    print(f"  R=Wetland, G=Grass, B=Fungal, A=Rock")
    
    return splatmap

if __name__ == "__main__":
    print("Generating Native Starter terrain...")
    try:
        generate_heightmap()
        generate_splatmap()
        print("\n✓ Done! Files created in resources/terrain/")
    except Exception as e:
        print(f"Error: {e}")
        import traceback
        traceback.print_exc()
