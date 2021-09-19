

__kernel void render(__global const vec3 *buff)
{
	int j = get_global_id(0);
	int i = get_global_id(1);
	color pixel_color(0, 0, 0);
	for (int s = 0; s < samples_per_pixel; ++s)
	{
		auto u = (i + random_double()) / (image_width - 1);
		auto v = (j + random_double()) / (image_heigth - 1);
		ray r = cam.get_ray(u, v);
		pixel_color += ray_color(r, world, max_depth);
	}
	buff[j][i] = pixel_color;
}

// TODO: Add OpenCL kernel code here.