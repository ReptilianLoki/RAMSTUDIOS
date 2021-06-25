//
// Add flash value to RGB (more white the higher flash is)
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float flash;

void main()
{
    vec4 c = texture2D(gm_BaseTexture, v_vTexcoord);	
	gl_FragColor = vec4(0.0,0.0,1.0,c.a);
}
