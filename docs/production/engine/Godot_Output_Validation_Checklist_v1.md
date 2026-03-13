# Godot Output Validation Checklist v1
**Project Avalon | Production | Engine Standards**

**Status:** LOCKED  
**Date:** March 13, 2026  
**Applies To:** All engine-facing agents  
**Enforced By:** QA/Scope Police  
**Purpose:** Mandatory checks before committing any Godot-related output.

---

## Pre-Commit Checklist

**Every agent must complete this before any commit.** Copy this checklist into your deliverable.

### For GDScript Files (.gd)

```markdown
## GDScript Validation
- [ ] File uses `class_name MyClassName` at top
- [ ] Extends appropriate base class (`Node`, `Node3D`, `CharacterBody3D`, etc.)
- [ ] All functions have type hints for parameters and return values
- [ ] Uses `@export` for configurable values (not hardcoded magic numbers)
- [ ] Signals defined for important events
- [ ] No obvious syntax errors (brackets match, colons present)
- [ ] File path follows convention: `scripts/{system}/{name}.gd`
```

### For Scene Files (.tscn)

```markdown
## TSCN Validation
- [ ] `load_steps` count verified: equals (ext_resource count + sub_resource count)
- [ ] All ext_resource IDs are unique and sequential
- [ ] All sub_resource IDs are unique
- [ ] All resource references match defined IDs exactly
- [ ] Transform values have exactly 12 numbers
- [ ] Color values use Color(r, g, b, a) format with 0.0-1.0 values
- [ ] Node parent paths are correct ("." for root, "Parent" for child, "Parent/Child" for nested)
- [ ] File path follows convention: `scenes/{category}/{name}.tscn`
- [ ] Can be parsed by Godot (no syntax errors)
```

### For JSON Data Files

```markdown
## JSON Validation
- [ ] Valid JSON syntax (no trailing commas, quotes match)
- [ ] Has consistent schema (IDs, structure matches other data files)
- [ ] IDs are unique and descriptive
- [ ] File path follows convention: `resources/data/{type}/{id}.json`
```

---

## Automated Validation (If Available)

Run these checks when possible:

```bash
# For .tscn files - count resources
check_tscn() {
    file=$1
    ext_count=$(grep -c "^\[ext_resource" "$file")
    sub_count=$(grep -c "^\[sub_resource" "$file")
    expected=$((ext_count + sub_count))
    
    load_steps=$(head -1 "$file" | grep -o "load_steps=[0-9]*" | cut -d= -f2)
    
    if [ "$load_steps" -eq "$expected" ]; then
        echo "✓ $file: load_steps correct ($load_steps)"
    else
        echo "✗ $file: load_steps=$load_steps, expected=$expected"
    fi
}

# Usage:
check_tscn scenes/world/regions/native_starter.tscn
```

---

## Manual Validation Steps

When automated checks aren't available:

### Step 1: Visual Review
Read the file line by line. Check:
- Brackets and quotes are balanced
- No obvious typos in resource IDs
- Transform matrices look reasonable (not all zeros, not absurd values)

### Step 2: Count Verification
1. Count `[ext_resource` lines
2. Count `[sub_resource` lines
3. Verify `load_steps` equals sum
4. Verify each `ExtResource("X_name")` has matching `[ext_resource id="X_name"`
5. Verify each `SubResource("Name")` has matching `[sub_resource id="Name"`

### Step 3: Path Verification
- All file paths start with `res://`
- Paths use forward slashes `/` not backslashes `\`
- Paths are lowercase with underscores

---

## Common Failure Patterns

| Pattern | Error | Prevention |
|---------|-------|------------|
| Off-by-one load_steps | Scene crashes on load | Always count manually |
| Wrong Color format | Material appears black | Use Color(r, g, b, a) not hex or 0-255 |
| Missing parent path | Node appears at wrong location | Verify parent="Path" exists |
| Duplicate IDs | Resource confusion | Ensure all IDs unique |
| Typos in references | "Unknown resource" error | Copy-paste IDs, don't retype |

---

## QA/Scope Police Enforcement

**QA checks every engine-facing deliverable against this checklist.**

If checklist not present → **REJECT**  
If items unchecked → **REJECT**  
If validation fails → **REJECT with specific errors**

**No exceptions.** Broken scenes break the project.

---

## Example Completed Checklist

```markdown
## Agent Output Protocol

**Status:** Proposed  
**Agent:** Worldbuilder  
**Date:** 2026-03-13  
**Responds To:** Native Starter Region Build

## Pre-Commit Validation

### TSCN Validation
- [x] load_steps count verified: 37 (2 ext + 35 sub)
- [x] All ext_resource IDs unique and sequential
- [x] All sub_resource IDs unique
- [x] All resource references match defined IDs
- [x] Transform values have 12 numbers
- [x] Color values use Color(r, g, b, a) format
- [x] Node parent paths correct
- [x] File path: scenes/world/regions/native_starter.tscn
- [ ] Tested in Godot (pending human validation)

## Known Limitations
- Terrain3D not yet integrated (requires editor setup)
- ProtonScatter not yet integrated (requires editor setup)

## Notes for Human
Test by opening in Godot 4.x. Should load without errors.
```

---

## Document References

- Godot_TSCN_Standards_v1.md — Syntax reference
- Godot_Implementation_Doctrine_v1.md — When to use what
- Godot_Worldbuilding_DoDont_v1.md — Patterns that work

---

*Validate before commit. No excuses.*
