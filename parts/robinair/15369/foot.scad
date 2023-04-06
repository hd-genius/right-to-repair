foot_diameter = 24;
cutout_diameter = 7;
cutout_depth = 12;
inset_height = 8; // aproximated - not yet measured
exposed_height = 5;

module Cutout() {
    cylinder(h = cutout_depth + 0.01, d = cutout_diameter);
}

module FootForm() {
    flat_radius = foot_diameter / 2 - exposed_height;
    cylinder(h = inset_height, d = foot_diameter);
    rotate_extrude()
    translate([0, inset_height])
    union() {
        translate([flat_radius, 0]) circle(r = exposed_height);
        square([flat_radius, exposed_height]);
    }
    
}

module Foot() {
    bottom_thickness = inset_height + exposed_height - cutout_depth;
    difference() {
        FootForm();
        translate([0, 0, bottom_thickness]) Cutout();
    }
}

Foot();