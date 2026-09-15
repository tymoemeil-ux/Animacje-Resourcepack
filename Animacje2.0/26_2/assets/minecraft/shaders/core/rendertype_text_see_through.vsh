#version 330

#moj_import <minecraft:fog.glsl>
#moj_import <minecraft:sample_lightmap.glsl>
#moj_import <minecraft:dynamictransforms.glsl>
#moj_import <minecraft:projection.glsl>
#moj_import <minecraft:globals.glsl>

in vec3 Position;
in vec4 Color;
in vec2 UV0;
in ivec2 UV2;

uniform sampler2D Sampler2;
out float sphericalVertexDistance;
out float cylindricalVertexDistance;

out vec4 vertexColor;
out vec2 texCoord0;

out float tfxID;
out vec4 tfxColor;
out vec2 tfxPos;

#moj_import <minecraft:tfx_common.vsh>

void main() {
    gl_Position = ProjMat * ModelViewMat * vec4(Position, 1.0);

    sphericalVertexDistance = fog_spherical_distance(Position);
    cylindricalVertexDistance = fog_cylindrical_distance(Position);

    texCoord0 = UV0;

    float tfxGlyph = floor(float(gl_VertexID) / 4.0);
    tfxDetect(ivec3(Color.rgb * 255.0 + 0.5), tfxGlyph);
    gl_Position.xy += tfxOffg;

    vertexColor = Color * sample_lightmap(Sampler2, UV2);

    if (tfxTintg.x >= 0.0) {
        vertexColor.rgb = tfxTintg;
    }
    vertexColor.a *= tfxAlphag;

    tfxID = tfxIDg;
    tfxColor = tfxBaseg;
    tfxPos = vec2(Position.x, Position.y);
}
