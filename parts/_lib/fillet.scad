module FilletCutoutProfile(radius, angle) {
    difference() {
        square([radius + 0.01, radius + 0.01]);
        circle(r = radius);
    }
}

module LinearFilletCutout(length, radius, angle = 90, external = true) {
    translate([-radius, length + 0.01, -radius])
    rotate([90, 0, 0])
    linear_extrude(length + 0.02) FilletCutoutProfile(radius, angle);
}

module RadialFilletCutout(angle, radius, fillet_radius, fillet_angle = 90) {
    rotate_extrude(angle = angle)
    translate([radius - fillet_radius, -fillet_radius])
    FilletCutoutProfile(fillet_radius, fillet_angle);
}