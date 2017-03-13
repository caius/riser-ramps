// Riser ramp, from top to bottom literally
translate([28, 0, 0]) {
  union() {
    // endplate
    translate([0, 0, 0]) {
      rotate([0, 270, 0]) {
        decking(length=140);
      }
    }

    // 200
    translate([0, 0, 28 * 3]) {
      mitred_decking(length=250);
    }

    // 400
    translate([0, 0, 28 * 2]) {
      mitred_decking(length=450);
    }

    // 600
    translate([0, 0, 28]) {
      mitred_decking(length=650);
    }

    // 800
    mitred_decking(length=800);
  }
}


// Decking (plank) with rounded edges & patterns
module decking(length) {
  difference() {
    translate([0, 2, 2]) {
      minkowski() {
        cube(size=[length, 120-4, 28-4]);
        rotate([0, 90, 0]) {
          cylinder(r=2, h=1);
        }
      }
    }

    // Larger holes down under
    for (i=[20:10:100]) {
      translate([-1, i, -2]) {
        rotate([0, 90, 0]) {
          cylinder(r=4, h=length+2);
        }
      }
    }

    // Smaller holes, topside
    for (i=[16:2:104]) {
      translate([-1, i, 28.75]) {
        rotate([0, 90, 0]) {
          cylinder(r=1.25, h=length+2);
        }
      }
    }
  }
}

// Intersection for us to appear to mitre the end of a plank
// basically an extruded triangle with extra padding to intersect nicely
module angle_prism(depth, width) {
  union() {
    translate([depth, 0, 0]) {
      rotate([0, 90, 90]) {
        linear_extrude(height=width, convexity=10) {
          polygon(points=[[0,0],[depth,0],[0,depth]], paths=[[0,1,2]]);
        }
      }
    }

    translate([depth-0.1, 0, -depth]) {
      cube(size=[2, width, depth+1]);
    }

    rotate([0, 90, 0]) {
      translate([-1, 0, 0]) {
        cube(size=[2, width, depth+1]);
      }
    }
  }
}

// Mitre the end of a plank
module mitred_decking(length) {
  difference() {
    decking(length=length);

    translate([length-28, 0, 28]) {
      angle_prism(28, 120+2);
    }
  }
}
