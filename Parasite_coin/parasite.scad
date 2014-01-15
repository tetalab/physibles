union(){
translate([0,0,10]) linear_extrude(file = "parasite.dxf", height = 20, center = true);
translate([75,90,0]) cylinder(h = 10, r=100);
}