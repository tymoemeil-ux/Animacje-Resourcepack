#version 150

#moj_import <minecraft:fog.glsl>

uniform float GameTime;
uniform vec4 ColorModulator;
uniform float FogStart;
uniform float FogEnd;
uniform vec4 FogColor;

#moj_import <minecraft:text_data.glsl>
#moj_import <minecraft:spin_effect.glsl>
#moj_import <minecraft:outline_effect.glsl>
#moj_import <minecraft:hatch_effect.glsl>
#moj_import <minecraft:neon_effect.glsl>
#moj_import <minecraft:split_effect.glsl>
#moj_import <minecraft:chromatic_effect.glsl>
#moj_import <minecraft:extrude_effect.glsl>
#moj_import <minecraft:noise_effect.glsl>
#moj_import <minecraft:liquid_effect.glsl>
#moj_import <minecraft:water_effect.glsl>
#moj_import <minecraft:shimmer_effect.glsl>
#moj_import <minecraft:sparkle_effect.glsl>
#moj_import <minecraft:flame_effect.glsl>
#moj_import <minecraft:laser_effect.glsl>
#moj_import <minecraft:holo_effect.glsl>
#moj_import <minecraft:glitch_hard_effect.glsl>
#moj_import <minecraft:matrix_effect.glsl>
#moj_import <minecraft:caustics_effect.glsl>
#moj_import <minecraft:warp_effect.glsl>
#moj_import <minecraft:krysztal_effect.glsl>
#moj_import <minecraft:portal_effect.glsl>
#moj_import <minecraft:xray_effect.glsl>
#moj_import <minecraft:termowizja_effect.glsl>
#moj_import <minecraft:neon_puls_effect.glsl>
#moj_import <minecraft:szklo_effect.glsl>
#moj_import <minecraft:zloty_blask_effect.glsl>
#moj_import <minecraft:diamet_effect.glsl>
#moj_import <minecraft:krew_effect.glsl>
#moj_import <minecraft:pianka_effect.glsl>
#moj_import <minecraft:dym_effect.glsl>
#moj_import <minecraft:piorun_effect.glsl>
#moj_import <minecraft:radioaktywny_effect.glsl>
#moj_import <minecraft:pulsar_effect.glsl>
#moj_import <minecraft:galaktyka_effect.glsl>
#moj_import <minecraft:tron_effect.glsl>
#moj_import <minecraft:prizma_effect.glsl>
#moj_import <minecraft:cukierek_effect.glsl>
#moj_import <minecraft:ocean_effect.glsl>
#moj_import <minecraft:czarna_dziura_effect.glsl>
#moj_import <minecraft:mrozy_effect.glsl>
#moj_import <minecraft:magma_effect.glsl>
#moj_import <minecraft:plasma_effect.glsl>
#moj_import <minecraft:aureola_effect.glsl>

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
    } else if (effectID == 24) {
        applyNeonPulsEffect(uv, fshBaseColor, fshEffectColor, fshEffectParams,
             fshGlyphT0, fshGlyphT1, fshGlyphT2, fshGlyphT3,
             GameTime, Sampler0, fragColor);
        fragColor.a *= fshDisplayAlpha;
        return;
    } else if (effectID == 25) {
        applySzkloEffect(uv, fshBaseColor, fshEffectColor, fshEffectParams,
             fshGlyphT0, fshGlyphT1, fshGlyphT2, fshGlyphT3,
             GameTime, Sampler0, fragColor);
        fragColor.a *= fshDisplayAlpha;
        return;
    } else if (effectID == 26) {
        applyZlotyBlaskEffect(uv, fshBaseColor, fshEffectColor, fshEffectParams,
             fshGlyphT0, fshGlyphT1, fshGlyphT2, fshGlyphT3,
             GameTime, Sampler0, fragColor);
        fragColor.a *= fshDisplayAlpha;
        return;
    } else if (effectID == 27) {
        applyDiametEffect(uv, fshBaseColor, fshEffectColor, fshEffectParams,
             fshGlyphT0, fshGlyphT1, fshGlyphT2, fshGlyphT3,
             GameTime, Sampler0, fragColor);
        fragColor.a *= fshDisplayAlpha;
        return;
    } else if (effectID == 28) {
        applyKrewEffect(uv, fshBaseColor, fshEffectColor, fshEffectParams,
             fshGlyphT0, fshGlyphT1, fshGlyphT2, fshGlyphT3,
             GameTime, Sampler0, fragColor);
        fragColor.a *= fshDisplayAlpha;
        return;
    } else if (effectID == 29) {
        applyPiankaEffect(uv, fshBaseColor, fshEffectColor, fshEffectParams,
             fshGlyphT0, fshGlyphT1, fshGlyphT2, fshGlyphT3,
             GameTime, Sampler0, fragColor);
        fragColor.a *= fshDisplayAlpha;
        return;
    } else if (effectID == 30) {
        applyDymEffect(uv, fshBaseColor, fshEffectColor, fshEffectParams,
             fshGlyphT0, fshGlyphT1, fshGlyphT2, fshGlyphT3,
             GameTime, Sampler0, fragColor);
        fragColor.a *= fshDisplayAlpha;
        return;
    } else if (effectID == 31) {
        applyPiorunEffect(uv, fshBaseColor, fshEffectColor, fshEffectParams,
             fshGlyphT0, fshGlyphT1, fshGlyphT2, fshGlyphT3,
             GameTime, Sampler0, fragColor);
        fragColor.a *= fshDisplayAlpha;
        return;
    } else if (effectID == 32) {
        applyRadioaktywnyEffect(uv, fshBaseColor, fshEffectColor, fshEffectParams,
             fshGlyphT0, fshGlyphT1, fshGlyphT2, fshGlyphT3,
             GameTime, Sampler0, fragColor);
        fragColor.a *= fshDisplayAlpha;
        return;
    } else if (effectID == 33) {
        applyPulsarEffect(uv, fshBaseColor, fshEffectColor, fshEffectParams,
             fshGlyphT0, fshGlyphT1, fshGlyphT2, fshGlyphT3,
             GameTime, Sampler0, fragColor);
        fragColor.a *= fshDisplayAlpha;
        return;
    } else if (effectID == 34) {
        applyGalaktykaEffect(uv, fshBaseColor, fshEffectColor, fshEffectParams,
             fshGlyphT0, fshGlyphT1, fshGlyphT2, fshGlyphT3,
             GameTime, Sampler0, fragColor);
        fragColor.a *= fshDisplayAlpha;
        return;
    } else if (effectID == 35) {
        applyTronEffect(uv, fshBaseColor, fshEffectColor, fshEffectParams,
             fshGlyphT0, fshGlyphT1, fshGlyphT2, fshGlyphT3,
             GameTime, Sampler0, fragColor);
        fragColor.a *= fshDisplayAlpha;
        return;
    } else if (effectID == 36) {
        applyPrizmaEffect(uv, fshBaseColor, fshEffectColor, fshEffectParams,
             fshGlyphT0, fshGlyphT1, fshGlyphT2, fshGlyphT3,
             GameTime, Sampler0, fragColor);
        fragColor.a *= fshDisplayAlpha;
        return;
    } else if (effectID == 37) {
        applyCukierekEffect(uv, fshBaseColor, fshEffectColor, fshEffectParams,
             fshGlyphT0, fshGlyphT1, fshGlyphT2, fshGlyphT3,
             GameTime, Sampler0, fragColor);
        fragColor.a *= fshDisplayAlpha;
        return;
    } else if (effectID == 38) {
        applyOceanEffect(uv, fshBaseColor, fshEffectColor, fshEffectParams,
             fshGlyphT0, fshGlyphT1, fshGlyphT2, fshGlyphT3,
             GameTime, Sampler0, fragColor);
        fragColor.a *= fshDisplayAlpha;
        return;
    } else if (effectID == 39) {
        applyCzarnaDziuraEffect(uv, fshBaseColor, fshEffectColor, fshEffectParams,
             fshGlyphT0, fshGlyphT1, fshGlyphT2, fshGlyphT3,
             GameTime, Sampler0, fragColor);
        fragColor.a *= fshDisplayAlpha;
        return;
    } else if (effectID == 40) {
        applyMrozyEffect(uv, fshBaseColor, fshEffectColor, fshEffectParams,
             fshGlyphT0, fshGlyphT1, fshGlyphT2, fshGlyphT3,
             GameTime, Sampler0, fragColor);
        fragColor.a *= fshDisplayAlpha;
        return;
    } else if (effectID == 41) {
        applyMagmaEffect(uv, fshBaseColor, fshEffectColor, fshEffectParams,
             fshGlyphT0, fshGlyphT1, fshGlyphT2, fshGlyphT3,
             GameTime, Sampler0, fragColor);
        fragColor.a *= fshDisplayAlpha;
        return;
    } else if (effectID == 42) {
        applyPlasmaEffect(uv, fshBaseColor, fshEffectColor, fshEffectParams,
             fshGlyphT0, fshGlyphT1, fshGlyphT2, fshGlyphT3,
             GameTime, Sampler0, fragColor);
        fragColor.a *= fshDisplayAlpha;
        return;
    } else if (effectID == 43) {
        applyAureolaEffect(uv, fshBaseColor, fshEffectColor, fshEffectParams,
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
