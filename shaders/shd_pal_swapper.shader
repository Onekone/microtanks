attribute vec3 in_Position;                  // (x,y,z)
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform sampler2D palette_texture;
uniform vec2 texel_size;
uniform vec4 palette_UVs;
uniform float palette_index;

void main()
{
    vec4 source = texture2D( gm_BaseTexture, v_vTexcoord );
    
    DoAlphaTest( source );
    
    float py = palette_UVs.y;
    float pw = palette_UVs.w;
    float ty = texel_size.y;
    for(int k = 0; k < 16; k++ )
    {
        if (py >= pw) {
            break;
        }
        if (distance(source, texture2D(palette_texture, vec2(palette_UVs.x, py))) <= 0.004)
        {
            float palette_V = palette_UVs.x + texel_size.x * palette_index;
            source = texture2D(palette_texture, vec2(palette_V, py));
            break;
        }
        py += ty;
    }

    gl_FragColor = source * v_vColour;
    
}
