use <write.scad>

// Define box size
// it will compute the hole to leave inside these box
// depending on the wall size
box_size = [120,30,90];
wall_size = 1.6;
inner_size = [
	box_size[0] - (wall_size * 2), 
	box_size[1] - (wall_size * 2),
	box_size[2] - wall_size
];
top_position = box_size[1] + 20;

// Create main box
union()
{
	// Create box with hole inside
	difference()
	{
		cube(box_size);
		translate([wall_size, wall_size, 0]) cube(inner_size);
	}

	// Create attachment zone on the back
	difference()
	{
		union()
		{
			for (position = [6, 2, 1.2])
			{
				translate([(box_size[0] / position) - 5, box_size[1], 0]) cube([10, wall_size * 3, box_size[2]]);
			}
		}

		// Create attachment holes
		translate([0, box_size[1], wall_size]) cube([box_size[0], wall_size * 2, (box_size[2] / 3) - (wall_size * 2)]);
		translate([0, box_size[1], (box_size[2] / 3) + (wall_size * 2)]) cube([box_size[0], wall_size * 2, (box_size[2] / 3) - (wall_size * 2)]);
		translate([0, box_size[1], (box_size[2] / 3 * 2) + (wall_size * 2)]) cube([box_size[0], wall_size * 2, (box_size[2] / 3) - (wall_size * 4)]);
	}

	// Write logo
	translate([10,0,10])
	rotate(90,[1,0,0])
	write("Tetaneutral.net",h=10, t=0.4);
}

// Create top
difference()
{
	union()
	{
		translate([0, top_position, 0]) cube([box_size[0], box_size[1], wall_size]);
		translate([wall_size, top_position + wall_size, wall_size]) cube([inner_size[0], inner_size[1], 10]);
	}

	translate([30, top_position, wall_size]) cube([box_size[0] - 60, box_size[1], 10]);
	translate([wall_size * 2, top_position + wall_size * 2, wall_size]) cube([inner_size[0] - wall_size * 2, inner_size[1] - wall_size * 2, 10]);
}