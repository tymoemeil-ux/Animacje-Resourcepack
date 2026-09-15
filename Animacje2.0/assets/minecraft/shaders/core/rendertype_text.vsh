#version 150

#moj_import <fog.glsl>

uniform mat4 ProjMat;
uniform mat4 ModelViewMat;
uniform vec4 ColorModulator;
uniform float GameTime;
uniform int FogShape;

in vec3 Position;
in vec4 Color;
in vec2 UV0;
in ivec2 UV2;

uniform sampler2D Sampler2;

out float vertexDistance;
out vec4 vertexColor;
out vec2 texCoord0;

out float tfxID;
out vec4 tfxColor;
out vec2 tfxPos;

#moj_import <tfx_common.vsh>

void main() {
    gl_Position = ProjMat * ModelViewMat * vec4(Position, 1.0);

    vec4 viewPos = ModelViewMat * vec4(Position, 1.0);
    vertexDistance = FogShape == 0 ? length(viewPos.xyz) : max(length(viewPos.xz), abs(viewPos.y));
    texCoord0 = UV0;

    float tfxGlyph = floor(float(gl_VertexID) / 4.0);
    tfxDetect(ivec3(Color.rgb * 255.0 + 0.5), tfxGlyph);
    gl_Position.xy += tfxOffg;

    vertexColor = Color * texelFetch(Sampler2, UV2 / 16, 0);
    if (tfxTintg.x >= 0.0) {
        vertexColor.rgb = tfxTintg;
    }
    vertexColor.a *= tfxAlphag;

    tfxID = tfxIDg;
    tfxColor = tfxBaseg;
    tfxPos = vec2(Position.x, Position.y);
}
