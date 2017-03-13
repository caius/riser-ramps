# explicit wildcard expansion suppresses errors when no files are found
include $(wildcard *.deps)

.PHONY: all
all: riser-ramps.stl riser-ramps.png

riser-ramps.png:
	openscad --autocenter --camera=450,60,60,80,0,45,2000 --proportion=persp --imgsize=640,640 --render -o riser-ramps.png riser-ramps.scad

%.stl: %.scad
	openscad -m make -o $@ -d $@.deps $<

clean:
	rm -rf *.stl *.png
