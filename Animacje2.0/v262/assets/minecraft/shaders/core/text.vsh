#version 330

#if !defined(IS_GUI) && !defined(IS_SEE_THROUGH)
#moj_import <minecraft:fog.glsl>
#moj_import <minecraft:sample_lightmap.glsl>
#endif

#moj_import <minecraft:dynamictransforms.glsl>
#moj_import <minecraft:projection.glsl>
#moj_import <minecraft:globals.glsl>

#define GameTime (GameTime * 1200.0)

in vec3 Position;
in vec4 Color;
in vec2 UV0;
#if !defined(IS_GUI) && !defined(IS_SEE_THROUGH)
in ivec2 UV2;
#endif

#if !defined(IS_GUI) && !defined(IS_SEE_THROUGH)
uniform sampler2D Sampler2;
out float sphericalVertexDistance;
out float cylindricalVertexDistance;
#endif

out vec4 vertexColor;
out vec2 texCoord0;

out float tfxID;
out vec4 tfxColor;
out vec2 tfxPos;

#moj_import <minecraft:tfx_common.vsh>

void main() {
    gl_Position = ProjMat * ModelViewMat * vec4(Position, 1.0);

#if !defined(IS_GUI) && !defined(IS_SEE_THROUGH)
    sphericalVertexDistance = fog_spherical_distance(Position);
    cylindricalVertexDistance = fog_cylindrical_distance(Position);
    vertexColor = Color * sample_lightmap(Sampler2, UV2);
#else
    vertexColor = Color;
#endif
    texCoord0 = UV0;

    float tfxGlyph = floor(float(gl_VertexID) / 4.0);
    tfxDetect(ivec3(Color.rgb * 255.0 + 0.5), tfxGlyph);
    gl_Position.xy += tfxOffg;

    if (tfxTintg.x >= 0.0) {
        vertexColor.rgb = tfxTintg;
    }
    vertexColor.a *= tfxAlphag;

    tfxID = tfxIDg;
    tfxColor = tfxBaseg;
    tfxPos = vec2(Position.x, Position.y);
}
