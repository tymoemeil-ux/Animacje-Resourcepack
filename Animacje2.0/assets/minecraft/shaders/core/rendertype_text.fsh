#version 330

#moj_import <minecraft:fog.glsl>
#moj_import <minecraft:dynamictransforms.glsl>
#moj_import <minecraft:globals.glsl>

uniform sampler2D Sampler0;
in float sphericalVertexDistance;
in float cylindricalVertexDistance;
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
    vec4 texColor = texture(Sampler0, uv);
    vec4 color = texColor * vertexColor * ColorModulator;

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
    } else if (tfx == 26) {
        color = tfxRenderPlazma(uv, texColor, tfxColor);
    } else if (tfx == 27) {
        color = tfxRenderOgien(uv, texColor, tfxColor);
    } else if (tfx == 28) {
        color = tfxRenderLod(uv, texColor, tfxColor);
    } else if (tfx == 29) {
        color = tfxRenderDiament(uv, texColor, tfxColor);
    } else if (tfx == 30) {
        color = tfxRenderAurora(uv, texColor, tfxColor);
    } else if (tfx == 31) {
        color = tfxRenderOcean(uv, texColor, tfxColor);
    } else if (tfx == 32) {
        color = tfxRenderNeonGrad(uv, texColor, tfxColor);
    } else if (tfx == 33) {
        color = tfxRenderChroma(uv, texColor, tfxColor);
    } else if (tfx == 34) {
        color = tfxRenderMorse(uv, texColor, tfxColor);
    } else if (tfx == 35) {
        color = tfxRenderRadar(uv, texColor, tfxColor);
    } else if (tfx == 36) {
        color = tfxRenderGlow(uv, texColor, tfxColor);
    } else if (tfx == 37) {
        color = tfxRenderHolo(uv, texColor, tfxColor);
    } else if (tfx == 38) {
        color = tfxRenderStaticTv(uv, texColor, tfxColor);
    }
    if (color.a < 0.1) {
        discard;
    }

    fragColor = apply_fog(color, sphericalVertexDistance, cylindricalVertexDistance, FogEnvironmentalStart, FogEnvironmentalEnd, FogRenderDistanceStart, FogRenderDistanceEnd, FogColor);
}
