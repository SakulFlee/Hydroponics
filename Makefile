### Makefile ###
# Use `make` or `make all` to build all models.
# Use `make parts_only` to only build parts.
# Use `make demos_only` to only build demos.
# Use `make clean` to clean-up and remove all models from the build folder.
# Use `make <filename>.stl` to compile any SCAD file into STL.

### Settings
# Path to OpenSCAD (use `openscad` if in PATH)
OSCAD=openscad
# Folder containing all SCAD files
SOURCE_FOLDER=src
# Folder receiving all STL files
BUILD_FOLDER=build
# STL Format
# Use 'asciistl' for legacy ASCII STL's instead of binary ('binstl')
STL_FORMAT=binstl

### Rules
# Default rule
# Builds all parts and demos
all: parts_only demo_only

# Only build parts
parts_only: 0_way.stl 1_way.stl 2_way.stl 3_way.stl 4_way.stl 5_way.stl resevoir.stl tray.stl tube_with_hole.stl cover.stl planter.stl stand.stl 

# Only build demos
demo_only: demo_assembled.stl demo_planter.stl demo_tray.stl demo_xways.stl demo_sidecut.stl demo_stand.stl

# Creates build folder
$(BUILD_FOLDER):
	mkdir $(BUILD_FOLDER)

# Compiles SCAD (OpenSCAD) files into STL
%.stl: $(SOURCE_FOLDER)/%.scad $(BUILD_FOLDER)
	$(OSCAD) \
		--export-format $(STL_FORMAT) \
		--D $$fn=100 \
		-o $(BUILD_FOLDER)/$@ \
		$<

# Removes all STL files (i.e. build folder)
clean:
	rm -r "$(BUILD_FOLDER)"
