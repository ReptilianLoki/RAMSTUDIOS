//draw setup
animation_initialize(); 

//rainbow shader variables
_uniUV         = shader_get_uniform(rainbow_shader, "u_uv");
_uniTime       = shader_get_uniform(rainbow_shader, "u_time");
_uniSpeed      = shader_get_uniform(rainbow_shader, "u_speed");
_uniSection    = shader_get_uniform(rainbow_shader, "u_section");
_uniSaturation = shader_get_uniform(rainbow_shader, "u_saturation"); 
_uniBrightness = shader_get_uniform(rainbow_shader, "u_brightness");
_uniMix        = shader_get_uniform(rainbow_shader, "u_mix");
_time  = 0;		
_speed = 5.0;
_section = 0.5;
_saturation = 1;
_brightness = 1;
_mix = 0.5;

//stay on first image
image_speed = 0; 