#version 330

#if !defined(IS_GUI) && !defined(IS_SEE_THROUGH)
#moj_import <minecraft:fog.glsl>
#endif

#moj_import <minecraft:dynamictransforms.glsl>
#moj_import <minecraft:globals.glsl>

// 26.x: GameTime = ulek dnia (0..1 w 20 min) -> zamiana na sekundy
#define GameTime (GameTime * 1200.0)

uniform sampler2D Sampler0;

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

#moj_import <minecraft:tfx_common.fsh>

void main() {
#ifdef IS_GRAYSCALE
    vec4 texColor = texture(Sampler0, texCoord0).rrrr;
#else
    vec4 texColor = texture(Sampler0, texCoord0);
#endif

#ifdef IS_SEE_THROUGH
    vec4 color = texColor * vertexColor;
#else
    vec4 color = texColor * vertexColor * ColorModulator;
#endif

    vec2 uv = texCoord0;
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
    } else if (tfx == 14) {
        color = tfxRenderWaveColor(uv, texColor, tfxColor);
    } else if (tfx == 15) {
        color = tfxRenderWaveBigColor(uv, texColor, tfxColor);
    } else if (tfx == 16) {
        color = tfxRenderRainbowColor(uv, texColor, tfxColor);
    } else if (tfx == 17) {
        color = tfxRenderGlitchHardColor(uv, texColor, tfxColor);
    } else if (tfx == 18) {
        color = tfxRenderTsunamiColor(uv, texColor, tfxColor);
    } else if (tfx == 19) {
        color = tfxRenderKaruzelaColor(uv, texColor, tfxColor);
    } else if (tfx == 20) {
        color = tfxRenderTornadoColor(uv, texColor, tfxColor);
    } else if (tfx == 21) {
        color = tfxRenderBumperColor(uv, texColor, tfxColor);
    } else if (tfx == 22) {
        color = tfxRenderPulseColor(uv, texColor, tfxColor);
    } else if (tfx == 23) {
        color = tfxRenderHeartbeatColor(uv, texColor, tfxColor);
    } else if (tfx == 24) {
        color = tfxRenderFlickerColor(uv, texColor, tfxColor);
    } else if (tfx == 25) {
        color = tfxRenderShakeColor(uv, texColor, tfxColor);
    } else if (tfx == 39) {
        color = tfxRenderRippleColor(uv, texColor, tfxColor);
    } else if (tfx == 40) {
        color = tfxRenderOrbitaColor(uv, texColor, tfxColor);
    } else if (tfx == 41) {
        color = tfxRenderSkokColor(uv, texColor, tfxColor);
    } else if (tfx == 42) {
        color = tfxRenderSwayColor(uv, texColor, tfxColor);
    } else if (tfx == 43) {
        color = tfxRenderHopwaveColor(uv, texColor, tfxColor);
    } else if (tfx == 44) {
        color = tfxRenderWobbleColor(uv, texColor, tfxColor);
    } else if (tfx == 45) {
        color = tfxRenderSpinColor(uv, texColor, tfxColor);
    } else if (tfx == 46) {
        color = tfxRenderTremorColor(uv, texColor, tfxColor);
    } else if (tfx == 47) {
        color = tfxRenderFloatyColor(uv, texColor, tfxColor);
    } else if (tfx == 48) {
        color = tfxRenderZigzagColor(uv, texColor, tfxColor);
    } else if (tfx == 49) {
        color = tfxRenderSprynaColor(uv, texColor, tfxColor);
    } else if (tfx == 50) {
        color = tfxRenderSzarpColor(uv, texColor, tfxColor);
    } else if (tfx == 51) {
        color = tfxRenderTancuj(uv, texColor, tfxColor);
    } else if (tfx == 52) {
        color = tfxRenderLawina(uv, texColor, tfxColor);
    } else if (tfx == 53) {
        color = tfxRenderDym(uv, texColor, tfxColor);
    } else if (tfx == 54) {
        color = tfxRenderNeonOdech(uv, texColor, tfxColor);
    } else if (tfx == 55) {
        color = tfxRenderWinda(uv, texColor, tfxColor);
    } else if (tfx == 56) {
        color = tfxRenderKaruzelaNeon(uv, texColor, tfxColor);
    } else if (tfx == 57) {
        color = tfxRenderNeonDeszcz(uv, texColor, tfxColor);
    } else if (tfx == 58) {
        color = tfxRenderKonfetti(uv, texColor, tfxColor);
    } else if (tfx == 59) {
        color = tfxRenderFalaFioletowa(uv, texColor, tfxColor);
    } else if (tfx == 60) {
        color = tfxRenderFalaZlota(uv, texColor, tfxColor);
    } else if (tfx == 61) {
        color = tfxRenderMagnes(uv, texColor, tfxColor);
    } else if (tfx == 62) {
        color = tfxRenderSznurek(uv, texColor, tfxColor);
    } else if (tfx == 63) {
        color = tfxRenderFalaZielona(uv, texColor, tfxColor);
    } else if (tfx == 64) {
        color = tfxRenderFalaRozowa(uv, texColor, tfxColor);
    } else if (tfx == 65) {
        color = tfxRenderPrad(uv, texColor, tfxColor);
    } else if (tfx == 66) {
        color = tfxRenderLuna(uv, texColor, tfxColor);
    } else if (tfx == 67) {
        color = tfxRenderBateria(uv, texColor, tfxColor);
    } else if (tfx == 68) {
        color = tfxRenderWyskok(uv, texColor, tfxColor);
    } else if (tfx == 69) {
        color = tfxRenderTarcza(uv, texColor, tfxColor);
    } else if (tfx == 70) {
        color = tfxRenderGwiazdki(uv, texColor, tfxColor);
    } else if (tfx == 71) {
        color = tfxRenderNeonLaser(uv, texColor, tfxColor);
    } else if (tfx == 72) {
        color = tfxRenderWstecz(uv, texColor, tfxColor);
    } else if (tfx == 73) {
        color = tfxRenderMorska(uv, texColor, tfxColor);
    } else if (tfx == 74) {
        color = tfxRenderKarmazyn(uv, texColor, tfxColor);
    } else if (tfx == 75) {
        color = tfxRenderWizja(uv, texColor, tfxColor);
    }

    if (color.a < 0.1) {
        discard;
    }

#ifdef IS_SEE_THROUGH
    fragColor = color * ColorModulator;
#elif defined(IS_GUI)
    fragColor = color;
#else
    fragColor = apply_fog(color, sphericalVertexDistance, cylindricalVertexDistance, FogEnvironmentalStart, FogEnvironmentalEnd, FogRenderDistanceStart, FogRenderDistanceEnd, FogColor);
#endif
}
