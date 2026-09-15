#version 330

#moj_import <minecraft:fog.glsl>
#moj_import <minecraft:dynamictransforms.glsl>
#moj_import <minecraft:globals.glsl>
#moj_import <minecraft:text_data.glsl>
#moj_import <minecraft:spin_effect.glsl>
#moj_import <minecraft:neon_effect.glsl>
#moj_import <minecraft:neon_puls_effect.glsl>
#moj_import <minecraft:zloty_blask_effect.glsl>
#moj_import <minecraft:krew_effect.glsl>
#moj_import <minecraft:piorun_effect.glsl>
#moj_import <minecraft:galaktyka_effect.glsl>
#moj_import <minecraft:blysk_effect.glsl>
#moj_import <minecraft:tecafala_effect.glsl>
#moj_import <minecraft:kaskada_effect.glsl>
#moj_import <minecraft:neonfala_effect.glsl>
#moj_import <minecraft:laser2_effect.glsl>
#moj_import <minecraft:grzmot_effect.glsl>
#moj_import <minecraft:obrys_effect.glsl>

uniform sampler2D Sampler0;

in float sphericalVertexDistance;
in float cylindricalVertexDistance;
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

    if (effectID == 3) {

        applyNeonEffect(uv, fshEffectColor, fshEffectParams,
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
    } else if (effectID == 26) {

        applyZlotyBlaskEffect(uv, fshBaseColor, fshEffectColor, fshEffectParams,
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
    } else if (effectID == 31) {

        applyPiorunEffect(uv, fshBaseColor, fshEffectColor, fshEffectParams,
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
    } else if (effectID == 44) {

        applyBlyskEffect(uv, fshBaseColor, fshEffectColor, fshEffectParams,
             fshGlyphT0, fshGlyphT1, fshGlyphT2, fshGlyphT3,
             GameTime, Sampler0, fragColor);
        fragColor.a *= fshDisplayAlpha;
        return;
    } else if (effectID == 47) {

        applyTecfalaEffect(uv, fshBaseColor, fshEffectColor, fshEffectParams,
             fshGlyphT0, fshGlyphT1, fshGlyphT2, fshGlyphT3,
             GameTime, Sampler0, fragColor);
        fragColor.a *= fshDisplayAlpha;
        return;
    } else if (effectID == 54) {

        applyKaskadaEffect(uv, fshBaseColor, fshEffectColor, fshEffectParams,
             fshGlyphT0, fshGlyphT1, fshGlyphT2, fshGlyphT3,
             GameTime, Sampler0, fragColor);
        fragColor.a *= fshDisplayAlpha;
        return;
    } else if (effectID == 55) {

        applyNeonfalaEffect(uv, fshBaseColor, fshEffectColor, fshEffectParams,
             fshGlyphT0, fshGlyphT1, fshGlyphT2, fshGlyphT3,
             GameTime, Sampler0, fragColor);
        fragColor.a *= fshDisplayAlpha;
        return;
    } else if (effectID == 60) {

        applyLaser2Effect(uv, fshBaseColor, fshEffectColor, fshEffectParams,
             fshGlyphT0, fshGlyphT1, fshGlyphT2, fshGlyphT3,
             GameTime, Sampler0, fragColor);
        fragColor.a *= fshDisplayAlpha;
        return;
    } else if (effectID == 62) {

        applyGrzmotEffect(uv, fshBaseColor, fshEffectColor, fshEffectParams,
             fshGlyphT0, fshGlyphT1, fshGlyphT2, fshGlyphT3,
             GameTime, Sampler0, fragColor);
        fragColor.a *= fshDisplayAlpha;
        return;
    } else if (effectID == 64) {

        applyObrysEffect(uv, fshBaseColor, fshEffectColor, fshEffectParams,
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

    fragColor = apply_fog(color, sphericalVertexDistance, cylindricalVertexDistance, FogEnvironmentalStart, FogEnvironmentalEnd, FogRenderDistanceStart, FogRenderDistanceEnd, FogColor);

    if (vertexColor.rgb == vec3(1.0, 1.0, 1.0)) {
        fragColor = color;
    }
}
