#version 150

#moj_import <fog.glsl>

uniform float GameTime;
uniform vec4 ColorModulator;
uniform float FogStart;
uniform float FogEnd;
uniform vec4 FogColor;

#moj_import <text_data.glsl>
#moj_import <spin_effect.glsl>
#moj_import <outline_effect.glsl>
#moj_import <hatch_effect.glsl>
#moj_import <neon_effect.glsl>
#moj_import <split_effect.glsl>
#moj_import <chromatic_effect.glsl>
#moj_import <extrude_effect.glsl>
#moj_import <noise_effect.glsl>
#moj_import <liquid_effect.glsl>
#moj_import <water_effect.glsl>
#moj_import <shimmer_effect.glsl>
#moj_import <sparkle_effect.glsl>
#moj_import <flame_effect.glsl>
#moj_import <laser_effect.glsl>
#moj_import <holo_effect.glsl>
#moj_import <glitch_hard_effect.glsl>
#moj_import <matrix_effect.glsl>
#moj_import <caustics_effect.glsl>
#moj_import <warp_effect.glsl>
#moj_import <krysztal_effect.glsl>
#moj_import <portal_effect.glsl>
#moj_import <xray_effect.glsl>
#moj_import <termowizja_effect.glsl>

uniform sampler2D Sampler0;

in float vertexDistance;
in vec4 vertexColor;
in vec2 texCoord0;

in vec3 spinT0;
in vec3 spinT1;
in vec3 spinT2;
in vec3 spinT3;
in float spinFlip;
in float spinScale;

in float fshEffectID;
in vec4 fshBaseColor;
in vec2 fshCharUV;
in vec4 fshEffectColor;
in vec4 fshExtrudeColor2;
in vec4 fshExtrudeColor3;
in vec4 fshEffectParams;
in vec3 fshGlyphT0;
in vec3 fshGlyphT1;
in vec3 fshGlyphT2;
in vec3 fshGlyphT3;
in float fshDisplayAlpha;

out vec4 fragColor;

void main() {
    vec2 uv = texCoord0;

    applySpinEffect(uv, spinT0, spinT1, spinT2, spinT3, spinScale, spinFlip, texCoord0, Sampler0);

    int effectID = int(fshEffectID + 0.5);

    if (effectID == 1) {
        applyOutlineEffect(uv, fshBaseColor, fshEffectColor, fshEffectParams,
                           fshGlyphT0, fshGlyphT1, fshGlyphT2, fshGlyphT3,
                           Sampler0, fragColor);
        fragColor.a *= fshDisplayAlpha;
        return;
    } else if (effectID == 2) {
        applyHatchEffect(uv, fshBaseColor, fshEffectColor, fshEffectParams,
                         fshGlyphT0, fshGlyphT1, fshGlyphT2, fshGlyphT3,
                         GameTime, Sampler0, fragColor);
        fragColor.a *= fshDisplayAlpha;
        return;
    } else if (effectID == 3) {
        applyNeonEffect(uv, fshEffectColor, fshEffectParams,
                        fshGlyphT0, fshGlyphT1, fshGlyphT2, fshGlyphT3,
                        GameTime, Sampler0, fragColor);
        fragColor.a *= fshDisplayAlpha;
        return;
    } else if (effectID == 5) {
        applySplitEffect(uv, fshBaseColor, fshEffectColor, fshEffectParams,
                            fshGlyphT0, fshGlyphT1, fshGlyphT2, fshGlyphT3,
                            GameTime, Sampler0, fragColor);
        fragColor.a *= fshDisplayAlpha;
        return;
    } else if (effectID == 6) {
        applyChromaticEffect(uv, fshBaseColor, fshEffectColor, fshEffectParams,
                             fshGlyphT0, fshGlyphT1, fshGlyphT2, fshGlyphT3,
                             GameTime, Sampler0, fragColor);
        fragColor.a *= fshDisplayAlpha;
        return;
    } else if (effectID == 7) {
        applyExtrudeEffect(uv, fshBaseColor, fshEffectColor, fshExtrudeColor2, fshExtrudeColor3,
                           fshEffectParams,
                           fshGlyphT0, fshGlyphT1, fshGlyphT2, fshGlyphT3,
                           Sampler0, fragColor);
        fragColor.a *= fshDisplayAlpha;
        return;
    } else if (effectID == 8) {
        applyNoiseEffect(uv, fshBaseColor, fshEffectColor, fshEffectParams,
                         fshGlyphT0, fshGlyphT1, fshGlyphT2, fshGlyphT3,
                         GameTime, Sampler0, fragColor);
        fragColor.a *= fshDisplayAlpha;
        return;
    } else if (effectID == 9) {
        applyLiquidEffect(uv, fshBaseColor, fshEffectColor, fshEffectParams,
                          fshGlyphT0, fshGlyphT1, fshGlyphT2, fshGlyphT3,
                          GameTime, Sampler0, fragColor);
        fragColor.a *= fshDisplayAlpha;
        return;
    } else if (effectID == 10) {
        applyWaterEffect(uv, fshBaseColor, fshEffectColor, fshEffectParams,
                         fshGlyphT0, fshGlyphT1, fshGlyphT2, fshGlyphT3,
                         GameTime, Sampler0, fragColor);
        fragColor.a *= fshDisplayAlpha;
        return;
    } else if (effectID == 11) {
        applyShimmerEffect(uv, fshBaseColor, fshEffectColor, fshEffectParams,
                           fshGlyphT0, fshGlyphT1, fshGlyphT2, fshGlyphT3,
                           GameTime, Sampler0, fragColor);
        fragColor.a *= fshDisplayAlpha;
        return;
    } else if (effectID == 12) {
        applySparkleEffect(uv, fshBaseColor, fshEffectColor, fshEffectParams,
                           fshGlyphT0, fshGlyphT1, fshGlyphT2, fshGlyphT3,
                           GameTime, Sampler0, fragColor);
        fragColor.a *= fshDisplayAlpha;
        return;
    } else if (effectID == 13) {
        applyFlameEffect(uv, fshBaseColor, fshEffectColor, fshEffectParams,
                         fshGlyphT0, fshGlyphT1, fshGlyphT2, fshGlyphT3,
                         GameTime, Sampler0, fragColor);
        fragColor.a *= fshDisplayAlpha;
        return;
    } else if (effectID == 14) {
        applyLaserEffect(uv, fshBaseColor, fshEffectColor, fshEffectParams,
             fshGlyphT0, fshGlyphT1, fshGlyphT2, fshGlyphT3,
             GameTime, Sampler0, fragColor);
        fragColor.a *= fshDisplayAlpha;
        return;
    } else if (effectID == 15) {
        applyHoloEffect(uv, fshBaseColor, fshEffectColor, fshEffectParams,
             fshGlyphT0, fshGlyphT1, fshGlyphT2, fshGlyphT3,
             GameTime, Sampler0, fragColor);
        fragColor.a *= fshDisplayAlpha;
        return;
    } else if (effectID == 16) {
        applyGlitchHardEffect(uv, fshBaseColor, fshEffectColor, fshEffectParams,
             fshGlyphT0, fshGlyphT1, fshGlyphT2, fshGlyphT3,
             GameTime, Sampler0, fragColor);
        fragColor.a *= fshDisplayAlpha;
        return;
    } else if (effectID == 17) {
        applyMatrixEffect(uv, fshBaseColor, fshEffectColor, fshEffectParams,
             fshGlyphT0, fshGlyphT1, fshGlyphT2, fshGlyphT3,
             GameTime, Sampler0, fragColor);
        fragColor.a *= fshDisplayAlpha;
        return;
    } else if (effectID == 18) {
        applyCausticsEffect(uv, fshBaseColor, fshEffectColor, fshEffectParams,
             fshGlyphT0, fshGlyphT1, fshGlyphT2, fshGlyphT3,
             GameTime, Sampler0, fragColor);
        fragColor.a *= fshDisplayAlpha;
        return;
    } else if (effectID == 19) {
        applyWarpEffect(uv, fshBaseColor, fshEffectColor, fshEffectParams,
             fshGlyphT0, fshGlyphT1, fshGlyphT2, fshGlyphT3,
             GameTime, Sampler0, fragColor);
        fragColor.a *= fshDisplayAlpha;
        return;
    } else if (effectID == 20) {
        applyKrysztalEffect(uv, fshBaseColor, fshEffectColor, fshEffectParams,
             fshGlyphT0, fshGlyphT1, fshGlyphT2, fshGlyphT3,
             GameTime, Sampler0, fragColor);
        fragColor.a *= fshDisplayAlpha;
        return;
    } else if (effectID == 21) {
        applyPortalEffect(uv, fshBaseColor, fshEffectColor, fshEffectParams,
             fshGlyphT0, fshGlyphT1, fshGlyphT2, fshGlyphT3,
             GameTime, Sampler0, fragColor);
        fragColor.a *= fshDisplayAlpha;
        return;
    } else if (effectID == 22) {
        applyXrayEffect(uv, fshBaseColor, fshEffectColor, fshEffectParams,
             fshGlyphT0, fshGlyphT1, fshGlyphT2, fshGlyphT3,
             GameTime, Sampler0, fragColor);
        fragColor.a *= fshDisplayAlpha;
        return;
    } else if (effectID == 23) {
        applyTermowizjaEffect(uv, fshBaseColor, fshEffectColor, fshEffectParams,
             fshGlyphT0, fshGlyphT1, fshGlyphT2, fshGlyphT3,
             GameTime, Sampler0, fragColor);
        fragColor.a *= fshDisplayAlpha;
        return;
    }

    vec4 color = texture(Sampler0, uv) * vertexColor * ColorModulator;

    TextData textData;
    textData.uv = uv;
    textData.spinT0 = spinT0;
    textData.spinT1 = spinT1;
    textData.spinT2 = spinT2;
    textData.spinT3 = spinT3;
    textData.color = color;
    textData.vertexColor = vertexColor;

    if (color.a < 0.1) {
        discard;
    }

    fragColor = linear_fog(color, vertexDistance, FogStart, FogEnd, FogColor);

    if (vertexColor.rgb == vec3(1.0, 1.0, 1.0)) {
        fragColor = color;
    }
}
