#version 330

#moj_import <minecraft:dynamictransforms.glsl>
#moj_import <minecraft:globals.glsl>

uniform sampler2D Sampler0;
in vec4 vertexColor;
in vec2 texCoord0;

in float tfxID;
in vec4 tfxColor;
in vec2 tfxPos;

out vec4 fragColor;

// 1.21.6+: GameTime = ulek dnia (0..1 w 20 min) -> zamiana na sekundy (jak w starszych wersjach)
#define GameTime (GameTime * 1200.0)

#moj_import <minecraft:tfx_common.fsh>

void main() {
    vec2 uv = texCoord0;
    vec4 texColor = texture(Sampler0, uv).rrrr;
    vec4 color = texColor * vertexColor;

    int tfx = int(tfxID + 0.5);
    if (tfx == 1) {
        color = tfxRenderBlysk(uv, texColor, tfxColor);
    } else if (tfx == 2) {
        color = tfxRenderNeonfala(uv, texColor, tfxColor);
    } else if (tfx == 3) {
        color = tfxRenderTecfala(uv, texColor, tfxColor);
    } else if (tfx == 4) {
        color = tfxRenderKaskada(uv, texColor, tfxColor);
    } else if (tfx == 5) {
        color = tfxRenderLaser2(uv, texColor, tfxColor);
    } else if (tfx == 6) {
        color = tfxRenderGrzmot(uv, texColor, tfxColor);
    } else if (tfx == 7) {
        color = tfxRenderObrys(uv, texColor, tfxColor);
    } else if (tfx == 8) {
        color = tfxRenderNeon(uv, texColor, tfxColor);
    } else if (tfx == 9) {
        color = tfxRenderNeonPuls(uv, texColor, tfxColor);
    } else if (tfx == 10) {
        color = tfxRenderZlotyBlask(uv, texColor, tfxColor);
    } else if (tfx == 11) {
        color = tfxRenderGalaktyka(uv, texColor, tfxColor);
    } else if (tfx == 12) {
        color = tfxRenderKrew(uv, texColor, tfxColor);
    } else if (tfx == 13) {
        color = tfxRenderPiorun(uv, texColor, tfxColor);
    }
    if (color.a < 0.1) {
        discard;
    }

    fragColor = color * ColorModulator;
}
