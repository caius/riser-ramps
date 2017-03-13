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
      decking(length=250);
    }

    // 400
    translate([0, 0, 28 * 2]) {
      decking(length=450);
    }

    // 600
    translate([0, 0, 28]) {
      decking(length=650);
    }

    // 800
    decking(length=800);
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
