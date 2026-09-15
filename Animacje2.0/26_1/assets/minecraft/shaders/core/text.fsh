#version 330

#if !defined(IS_GUI) && !defined(IS_SEE_THROUGH)
#moj_import <minecraft:fog.glsl>
#endif

#moj_import <minecraft:dynamictransforms.glsl>
#moj_import <minecraft:globals.glsl>

uniform sampler2D Sampler0;

#moj_import <minecraft:tfx_common.fsh>

#if !defined(IS_GUI) && !defined(IS_SEE_THROUGH)
in float sphericalVertexDistance;
in float cylindricalVertexDistance;
#endif

in vec4 vertexColor;
in vec2 texCoord0;

in float tfxID;
in vec4 tfxColor;
in vec2 tfxPos;

out vec4 fragColor;

void main() {
    vec2 uv = texCoord0;
#ifdef IS_GRAYSCALE
    vec4 texColor = texture(Sampler0, uv).rrrr;
#else
    vec4 texColor = texture(Sampler0, uv);
#endif
#ifdef IS_SEE_THROUGH
    vec4 color = texColor * vertexColor;
#else
    vec4 color = texColor * vertexColor * ColorModulator;
#endif

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

#ifdef IS_SEE_THROUGH
    fragColor = color * ColorModulator;
#elif defined(IS_GUI)
    fragColor = color;
#else
    fragColor = apply_fog(color, sphericalVertexDistance, cylindricalVertexDistance,
                           FogEnvironmentalStart, FogEnvironmentalEnd,
                           FogRenderDistanceStart, FogRenderDistanceEnd, FogColor);
#endif

    if (vertexColor.rgb == vec3(1.0, 1.0, 1.0)) {
        fragColor = color;
    }
}

