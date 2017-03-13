%.png: %.scad
	openscad --autocenter --render -o $@ $<
