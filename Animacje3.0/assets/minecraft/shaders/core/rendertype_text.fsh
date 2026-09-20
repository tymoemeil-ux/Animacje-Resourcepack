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
in float tfxCustom;

out vec4 fragColor;

#define GameTime (GameTime * 1200.0)

#moj_import <minecraft:tfx_common.fsh>

void main() {
    vec2 uv = texCoord0;
    vec4 texColor = texture(Sampler0, uv);
    vec4 color = texColor * vertexColor * ColorModulator;

    int tfx = int(tfxID + 0.5);
    if (tfx == 1) {
        color = tfxRenderBlysk(uv, texColor, tfxColor);
    }
    else if (tfx == 2) {
        color = tfxRenderNeonfala(uv, texColor, tfxColor);
    }
    else if (tfx == 3) {
        color = tfxRenderTecfala(uv, texColor, tfxColor);
    }
    else if (tfx == 4) {
        color = tfxRenderKaskada(uv, texColor, tfxColor);
    }
    else if (tfx == 5) {
        color = tfxRenderLaser2(uv, texColor, tfxColor);
    }
    else if (tfx == 6) {
        color = tfxRenderGrzmot(uv, texColor, tfxColor);
    }
    else if (tfx == 7) {
        color = tfxRenderNeon(uv, texColor, tfxColor);
    }
    else if (tfx == 8) {
        color = tfxRenderNeonPuls(uv, texColor, tfxColor);
    }
    else if (tfx == 9) {
        color = tfxRenderZlotyBlask(uv, texColor, tfxColor);
    }
    else if (tfx == 10) {
        color = tfxRenderGalaktyka(uv, texColor, tfxColor);
    }
    else if (tfx == 11) {
        color = tfxRenderPiorun(uv, texColor, tfxColor);
    }
    else if (tfx == 12) {
        color = tfxRenderPlazma(uv, texColor, tfxColor);
    }
    else if (tfx == 13) {
        color = tfxRenderOgien(uv, texColor, tfxColor);
    }
    else if (tfx == 14) {
        color = tfxRenderLod(uv, texColor, tfxColor);
    }
    else if (tfx == 15) {
        color = tfxRenderDiament(uv, texColor, tfxColor);
    }
    else if (tfx == 16) {
        color = tfxRenderAurora(uv, texColor, tfxColor);
    }
    else if (tfx == 17) {
        color = tfxRenderOcean(uv, texColor, tfxColor);
    }
    else if (tfx == 18) {
        color = tfxRenderNeonGrad(uv, texColor, tfxColor);
    }
    else if (tfx == 19) {
        color = tfxRenderChroma(uv, texColor, tfxColor);
    }
    else if (tfx == 20) {
        color = tfxRenderWaveColor(uv, texColor, tfxColor);
    }
    else if (tfx == 21) {
        color = tfxRenderRainbowColor(uv, texColor, tfxColor);
    }
    else if (tfx == 22) {
        color = tfxRenderGlitchHardColor(uv, texColor, tfxColor);
    }
    else if (tfx == 23) {
        color = tfxRenderTsunamiColor(uv, texColor, tfxColor);
    }
    else if (tfx == 24) {
        color = tfxRenderKaruzelaColor(uv, texColor, tfxColor);
    }
    else if (tfx == 25) {
        color = tfxRenderTornadoColor(uv, texColor, tfxColor);
    }
    else if (tfx == 26) {
        color = tfxRenderPulseColor(uv, texColor, tfxColor);
    }
    else if (tfx == 27) {
        color = tfxRenderHeartbeatColor(uv, texColor, tfxColor);
    }
    else if (tfx == 28) {
        color = tfxRenderRippleColor(uv, texColor, tfxColor);
    }
    else if (tfx == 29) {
        color = tfxRenderOrbitaColor(uv, texColor, tfxColor);
    }
    else if (tfx == 30) {
        color = tfxRenderSkokColor(uv, texColor, tfxColor);
    }
    else if (tfx == 31) {
        color = tfxRenderSpinColor(uv, texColor, tfxColor);
    }
    else if (tfx == 32) {
        color = tfxRenderFloatyColor(uv, texColor, tfxColor);
    }
    else if (tfx == 33) {
        color = tfxRenderZigzagColor(uv, texColor, tfxColor);
    }
    else if (tfx == 34) {
        color = tfxRenderTancuj(uv, texColor, tfxColor);
    }
    else if (tfx == 35) {
        color = tfxRenderLawina(uv, texColor, tfxColor);
    }
    else if (tfx == 36) {
        color = tfxRenderDym(uv, texColor, tfxColor);
    }
    else if (tfx == 37) {
        color = tfxRenderNeonDeszcz(uv, texColor, tfxColor);
    }
    else if (tfx == 38) {
        color = tfxRenderKonfetti(uv, texColor, tfxColor);
    }
    else if (tfx == 39) {
        color = tfxRenderFalaWodna(uv, texColor, tfxColor);
    }
    else if (tfx == 40) {
        color = tfxRenderSpirala(uv, texColor, tfxColor);
    }
    else if (tfx == 41) {
        color = tfxRenderMetronom(uv, texColor, tfxColor);
    }
    else if (tfx == 42) {
        color = tfxRenderMatrix(uv, texColor, tfxColor);
    }
    else if (tfx == 43) {
        color = tfxRenderGwiazdyZloto(uv, texColor, tfxColor);
    }
    else if (tfx == 44) {
        color = tfxRenderPulsarNeonowy(uv, texColor, tfxColor);
    }
    else if (tfx == 45) {
        color = tfxRenderWirGalaktyka(uv, texColor, tfxColor);
    }
    else if (tfx == 46) {
        color = tfxRenderKapWodny(uv, texColor, tfxColor);
    }
    else if (tfx == 47) {
        color = tfxRenderKometa(uv, texColor, tfxColor);
    }
    else if (tfx == 48) {
        color = tfxRenderIskry(uv, texColor, tfxColor);
    }
    else if (tfx == 49) {
        color = tfxRenderPryzmat(uv, texColor, tfxColor);
    }
    else if (tfx == 50) {
        color = tfxRenderSzklo(uv, texColor, tfxColor);
    }
    else if (tfx == 51) {
        color = tfxRenderSpectrum(uv, texColor, tfxColor);
    }
    else if (tfx == 52) {
        color = tfxRenderAuroraFlow(uv, texColor, tfxColor);
    }
    else if (tfx == 53) {
        color = tfxRenderSunset(uv, texColor, tfxColor);
    }
    else if (tfx == 54) {
        color = tfxRenderFirefly(uv, texColor, tfxColor);
    }
    else if (tfx == 55) {
        color = tfxRenderElectric(uv, texColor, tfxColor);
    }
    else if (tfx == 56) {
        color = tfxRenderGlow(uv, texColor, tfxColor);
    }
    else if (tfx == 57) {
        color = tfxRenderIceCrystal(uv, texColor, tfxColor);
    }
    else if (tfx == 58) {
        color = tfxRenderLava(uv, texColor, tfxColor);
    }
    else if (tfx == 59) {
        color = tfxRenderMoonlight(uv, texColor, tfxColor);
    }
    else if (tfx == 60) {
        color = tfxRenderStarlight(uv, texColor, tfxColor);
    }
    else if (tfx == 61) {
        color = tfxRenderGoldRush(uv, texColor, tfxColor);
    }
    else if (tfx == 62) {
        color = tfxRenderPixel(uv, texColor, tfxColor);
    }
    else if (tfx == 63) {
        color = tfxRenderScanline(uv, texColor, tfxColor);
    }
    else if (tfx == 64) {
        color = tfxRenderWave2(uv, texColor, tfxColor);
    }
    else if (tfx == 65) {
        color = tfxRenderRipple2(uv, texColor, tfxColor);
    }
    else if (tfx == 66) {
        color = tfxRenderBounce(uv, texColor, tfxColor);
    }
    else if (tfx == 67) {
        color = tfxRenderSwing(uv, texColor, tfxColor);
    }
    else if (tfx == 68) {
        color = tfxRenderJelly(uv, texColor, tfxColor);
    }
    else if (tfx == 69) {
        color = tfxRenderOrbit2(uv, texColor, tfxColor);
    }
    else if (tfx == 70) {
        color = tfxRenderComet2(uv, texColor, tfxColor);
    }
    else if (tfx == 71) {
        color = tfxRenderSparkle(uv, texColor, tfxColor);
    }
    else if (tfx == 72) {
        color = tfxRenderPrism2(uv, texColor, tfxColor);
    }
    else if (tfx == 73) {
        color = tfxRenderBreath(uv, texColor, tfxColor);
    }
    else if (tfx == 74) {
        color = tfxRenderGradient(uv, texColor, tfxColor);
    }
    else if (tfx == 75) {
        color = tfxRenderMirror(uv, texColor, tfxColor);
    }
    else if (tfx == 76) {
        color = tfxRenderHackMatrix(uv, texColor, tfxColor);
    }
    else if (tfx == 77) {
        color = tfxRenderHackTerminal(uv, texColor, tfxColor);
    }
    else if (tfx == 78) {
        color = tfxRenderHackCyber(uv, texColor, tfxColor);
    }
    else if (tfx == 79) {
        color = tfxRenderHackRedteam(uv, texColor, tfxColor);
    }
    else if (tfx == 80) {
        color = tfxRenderHackZeroday(uv, texColor, tfxColor);
    }
    else if (tfx == 81) {
        color = tfxRenderHackRoot(uv, texColor, tfxColor);
    }
    else if (tfx == 82) {
        color = tfxRenderHackBinary(uv, texColor, tfxColor);
    }
    else if (tfx == 83) {
        color = tfxRenderHackGlitch(uv, texColor, tfxColor);
    }
    else if (tfx == 84) {
        color = tfxRenderHackVirus(uv, texColor, tfxColor);
    }
    else if (tfx == 85) {
        color = tfxRenderHackOverclock(uv, texColor, tfxColor);
    }
    if (tfxCustom > 0.5) {
        float brightness = max(dot(color.rgb, vec3(0.30, 0.59, 0.11)), 0.18);
        color.rgb = clamp(tfxColor.rgb * (0.45 + brightness * 0.95), 0.0, 1.0);
    }

    if (color.a < 0.1) {
        discard;
    }

    fragColor = apply_fog(color, sphericalVertexDistance, cylindricalVertexDistance, FogEnvironmentalStart, FogEnvironmentalEnd, FogRenderDistanceStart, FogRenderDistanceEnd, FogColor);
}
