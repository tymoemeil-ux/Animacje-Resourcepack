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
    } else if (tfx == 76) {
        color = tfxRenderHelikopter(uv, texColor, tfxColor);
    } else if (tfx == 77) {
        color = tfxRenderSpirala(uv, texColor, tfxColor);
    } else if (tfx == 78) {
        color = tfxRenderWibrowanie(uv, texColor, tfxColor);
    } else if (tfx == 79) {
        color = tfxRenderFalstart(uv, texColor, tfxColor);
    } else if (tfx == 80) {
        color = tfxRenderWachlarz(uv, texColor, tfxColor);
    } else if (tfx == 81) {
        color = tfxRenderDeszczZiemi(uv, texColor, tfxColor);
    } else if (tfx == 82) {
        color = tfxRenderWznoszenie(uv, texColor, tfxColor);
    } else if (tfx == 83) {
        color = tfxRenderLosoweSkoki(uv, texColor, tfxColor);
    } else if (tfx == 84) {
        color = tfxRenderFalaWodna(uv, texColor, tfxColor);
    } else if (tfx == 85) {
        color = tfxRenderZygzakV2(uv, texColor, tfxColor);
    } else if (tfx == 86) {
        color = tfxRenderMetronom(uv, texColor, tfxColor);
    } else if (tfx == 87) {
        color = tfxRenderDrganiaMuzyczne(uv, texColor, tfxColor);
    } else if (tfx == 88) {
        color = tfxRenderPulsZer(uv, texColor, tfxColor);
    } else if (tfx == 89) {
        color = tfxRenderWielkieKolo(uv, texColor, tfxColor);
    } else if (tfx == 90) {
        color = tfxRenderFalowanieGora(uv, texColor, tfxColor);
    } else if (tfx == 91) {
        color = tfxRenderSzarpaczeFale(uv, texColor, tfxColor);
    } else if (tfx == 92) {
        color = tfxRenderUnoszenieFale(uv, texColor, tfxColor);
    } else if (tfx == 93) {
        color = tfxRenderTrzesieniePionowe(uv, texColor, tfxColor);
    } else if (tfx == 94) {
        color = tfxRenderFalaOdSrodka(uv, texColor, tfxColor);
    } else if (tfx == 95) {
        color = tfxRenderBungee(uv, texColor, tfxColor);
    } else if (tfx == 96) {
        color = tfxRenderNeonFiolet(uv, texColor, tfxColor);
    } else if (tfx == 97) {
        color = tfxRenderNeonCyjan(uv, texColor, tfxColor);
    } else if (tfx == 98) {
        color = tfxRenderZloto(uv, texColor, tfxColor);
    } else if (tfx == 99) {
        color = tfxRenderPlatyna(uv, texColor, tfxColor);
    } else if (tfx == 100) {
        color = tfxRenderMiedz(uv, texColor, tfxColor);
    } else if (tfx == 105) {
        color = tfxRenderTopaz(uv, texColor, tfxColor);
    } else if (tfx == 107) {
        color = tfxRenderNeonyTokio(uv, texColor, tfxColor);
    } else if (tfx == 108) {
        color = tfxRenderRetro(uv, texColor, tfxColor);
    } else if (tfx == 109) {
        color = tfxRenderPixel8bit(uv, texColor, tfxColor);
    } else if (tfx == 110) {
        color = tfxRenderTlen(uv, texColor, tfxColor);
    } else if (tfx == 111) {
        color = tfxRenderNeonAmber(uv, texColor, tfxColor);
    } else if (tfx == 112) {
        color = tfxRenderGalaktyczny(uv, texColor, tfxColor);
    } else if (tfx == 113) {
        color = tfxRenderTuszaNeon(uv, texColor, tfxColor);
    } else if (tfx == 114) {
        color = tfxRenderOlo(uv, texColor, tfxColor);
    } else if (tfx == 115) {
        color = tfxRenderRoseGold(uv, texColor, tfxColor);
    } else if (tfx == 116) {
        color = tfxRenderHelikopterZloto(uv, texColor, tfxColor);
    } else if (tfx == 117) {
        color = tfxRenderSpiralaPlatyna(uv, texColor, tfxColor);
    } else if (tfx == 118) {
        color = tfxRenderWibrowanieMiedz(uv, texColor, tfxColor);
    } else if (tfx == 119) {
        color = tfxRenderFalstartLawenda(uv, texColor, tfxColor);
    } else if (tfx == 120) {
        color = tfxRenderWachlarzSzmaragd(uv, texColor, tfxColor);
    } else if (tfx == 121) {
        color = tfxRenderDeszczZiemiRubin(uv, texColor, tfxColor);
    } else if (tfx == 122) {
        color = tfxRenderWznoszenieSzafir(uv, texColor, tfxColor);
    } else if (tfx == 123) {
        color = tfxRenderLosoweSkokiTopaz(uv, texColor, tfxColor);
    } else if (tfx == 124) {
        color = tfxRenderFalaWodnaPerla(uv, texColor, tfxColor);
    } else if (tfx == 125) {
        color = tfxRenderZygzakV2NeonyTokio(uv, texColor, tfxColor);
    } else if (tfx == 126) {
        color = tfxRenderMetronomRetro(uv, texColor, tfxColor);
    } else if (tfx == 127) {
        color = tfxRenderDrganiaMuzycznePixel8bit(uv, texColor, tfxColor);
    } else if (tfx == 128) {
        color = tfxRenderPulsZerTlen(uv, texColor, tfxColor);
    } else if (tfx == 129) {
        color = tfxRenderWielkieKoloNeonAmber(uv, texColor, tfxColor);
    } else if (tfx == 130) {
        color = tfxRenderFalowanieGoraGalaktyczny(uv, texColor, tfxColor);
    } else if (tfx == 131) {
        color = tfxRenderSzarpaczeFaleTuszaNeon(uv, texColor, tfxColor);
    } else if (tfx == 132) {
        color = tfxRenderUnoszenieFaleOlo(uv, texColor, tfxColor);
    } else if (tfx == 133) {
        color = tfxRenderTrzesieniePionoweRoseGold(uv, texColor, tfxColor);
    } else if (tfx == 134) {
        color = tfxRenderFalaOdSrodkaNeonFiolet(uv, texColor, tfxColor);
    } else if (tfx == 135) {
        color = tfxRenderBungeeNeonCyjan(uv, texColor, tfxColor);
    } else if (tfx == 136) {
        color = tfxRenderHelikopterSzmaragd(uv, texColor, tfxColor);
    } else if (tfx == 137) {
        color = tfxRenderSpiralaRubin(uv, texColor, tfxColor);
    } else if (tfx == 138) {
        color = tfxRenderWibrowanieSzafir(uv, texColor, tfxColor);
    } else if (tfx == 139) {
        color = tfxRenderFalstartTopaz(uv, texColor, tfxColor);
    } else if (tfx == 140) {
        color = tfxRenderWachlarzPerla(uv, texColor, tfxColor);
    } else if (tfx == 141) {
        color = tfxRenderDeszczZiemiNeonyTokio(uv, texColor, tfxColor);
    } else if (tfx == 142) {
        color = tfxRenderWznoszenieRetro(uv, texColor, tfxColor);
    } else if (tfx == 143) {
        color = tfxRenderLosoweSkokiPixel8bit(uv, texColor, tfxColor);
    } else if (tfx == 144) {
        color = tfxRenderFalaWodnaTlen(uv, texColor, tfxColor);
    } else if (tfx == 145) {
        color = tfxRenderZygzakV2NeonAmber(uv, texColor, tfxColor);
    } else if (tfx == 146) {
        color = tfxRenderMetronomGalaktyczny(uv, texColor, tfxColor);
    } else if (tfx == 147) {
        color = tfxRenderDrganiaMuzyczneTuszaNeon(uv, texColor, tfxColor);
    } else if (tfx == 148) {
        color = tfxRenderPulsZerOlo(uv, texColor, tfxColor);
    } else if (tfx == 149) {
        color = tfxRenderWielkieKoloRoseGold(uv, texColor, tfxColor);
    } else if (tfx == 150) {
        color = tfxRenderFalowanieGoraNeonFiolet(uv, texColor, tfxColor);
    } else if (tfx == 151) {
        color = tfxRenderSzarpaczeFaleNeonCyjan(uv, texColor, tfxColor);
    } else if (tfx == 152) {
        color = tfxRenderUnoszenieFaleZloto(uv, texColor, tfxColor);
    } else if (tfx == 153) {
        color = tfxRenderTrzesieniePionowePlatyna(uv, texColor, tfxColor);
    } else if (tfx == 154) {
        color = tfxRenderFalaOdSrodkaMiedz(uv, texColor, tfxColor);
    } else if (tfx == 155) {
        color = tfxRenderBungeeLawenda(uv, texColor, tfxColor);
    } else if (tfx == 156) {
        color = tfxRenderKotwica(uv, texColor, tfxColor);
    } else if (tfx == 157) {
        color = tfxRenderPiorko(uv, texColor, tfxColor);
    } else if (tfx == 158) {
        color = tfxRenderStrzala(uv, texColor, tfxColor);
    } else if (tfx == 159) {
        color = tfxRenderMost(uv, texColor, tfxColor);
    } else if (tfx == 160) {
        color = tfxRenderZegar(uv, texColor, tfxColor);
    } else if (tfx == 161) {
        color = tfxRenderSkakosz(uv, texColor, tfxColor);
    } else if (tfx == 162) {
        color = tfxRenderFalaKot(uv, texColor, tfxColor);
    } else if (tfx == 163) {
        color = tfxRenderPrzepylacz(uv, texColor, tfxColor);
    } else if (tfx == 164) {
        color = tfxRenderWielblik(uv, texColor, tfxColor);
    } else if (tfx == 165) {
        color = tfxRenderDeszczyk(uv, texColor, tfxColor);
    } else if (tfx == 166) {
        color = tfxRenderPtaszek(uv, texColor, tfxColor);
    } else if (tfx == 167) {
        color = tfxRenderRakieta(uv, texColor, tfxColor);
    } else if (tfx == 168) {
        color = tfxRenderWahadlo(uv, texColor, tfxColor);
    } else if (tfx == 169) {
        color = tfxRenderPlyn(uv, texColor, tfxColor);
    } else if (tfx == 170) {
        color = tfxRenderBumerang(uv, texColor, tfxColor);
    } else if (tfx == 171) {
        color = tfxRenderSrebro(uv, texColor, tfxColor);
    } else if (tfx == 172) {
        color = tfxRenderKrystal(uv, texColor, tfxColor);
    } else if (tfx == 173) {
        color = tfxRenderPolarna(uv, texColor, tfxColor);
    } else if (tfx == 174) {
        color = tfxRenderMagma(uv, texColor, tfxColor);
    } else if (tfx == 175) {
        color = tfxRenderMroz(uv, texColor, tfxColor);
    } else if (tfx == 176) {
        color = tfxRenderPryzmat(uv, texColor, tfxColor);
    } else if (tfx == 177) {
        color = tfxRenderSzampan(uv, texColor, tfxColor);
    } else if (tfx == 178) {
        color = tfxRenderGrafit(uv, texColor, tfxColor);
    } else if (tfx == 179) {
        color = tfxRenderMosiadz(uv, texColor, tfxColor);
    } else if (tfx == 180) {
        color = tfxRenderKarmel(uv, texColor, tfxColor);
    } else if (tfx == 181) {
        color = tfxRenderWisnia(uv, texColor, tfxColor);
    } else if (tfx == 182) {
        color = tfxRenderTrawa(uv, texColor, tfxColor);
    } else if (tfx == 183) {
        color = tfxRenderNiebo(uv, texColor, tfxColor);
    } else if (tfx == 184) {
        color = tfxRenderWschod(uv, texColor, tfxColor);
    } else if (tfx == 185) {
        color = tfxRenderZachod(uv, texColor, tfxColor);
    } else if (tfx == 186) {
        color = tfxRenderKotwicaSrebro(uv, texColor, tfxColor);
    } else if (tfx == 187) {
        color = tfxRenderPiorkoKrystal(uv, texColor, tfxColor);
    } else if (tfx == 188) {
        color = tfxRenderStrzalaPolarna(uv, texColor, tfxColor);
    } else if (tfx == 189) {
        color = tfxRenderMostMagma(uv, texColor, tfxColor);
    } else if (tfx == 190) {
        color = tfxRenderZegarMroz(uv, texColor, tfxColor);
    } else if (tfx == 191) {
        color = tfxRenderSkakoszPryzmat(uv, texColor, tfxColor);
    } else if (tfx == 192) {
        color = tfxRenderFalaKotSzampan(uv, texColor, tfxColor);
    } else if (tfx == 193) {
        color = tfxRenderPrzepylaczGrafit(uv, texColor, tfxColor);
    } else if (tfx == 194) {
        color = tfxRenderWielblikMosiadz(uv, texColor, tfxColor);
    } else if (tfx == 195) {
        color = tfxRenderDeszczykKarmel(uv, texColor, tfxColor);
    } else if (tfx == 196) {
        color = tfxRenderPtaszekWisnia(uv, texColor, tfxColor);
    } else if (tfx == 197) {
        color = tfxRenderRakietaTrawa(uv, texColor, tfxColor);
    } else if (tfx == 198) {
        color = tfxRenderWahadloNiebo(uv, texColor, tfxColor);
    } else if (tfx == 199) {
        color = tfxRenderPlynWschod(uv, texColor, tfxColor);
    } else if (tfx == 200) {
        color = tfxRenderBumerangZachod(uv, texColor, tfxColor);
    } else if (tfx == 201) {
        color = tfxRenderKotwicaMagma(uv, texColor, tfxColor);
    } else if (tfx == 202) {
        color = tfxRenderMostKrystal(uv, texColor, tfxColor);
    } else if (tfx == 203) {
        color = tfxRenderPiorkoPolarna(uv, texColor, tfxColor);
    } else if (tfx == 204) {
        color = tfxRenderSkakoszSzampan(uv, texColor, tfxColor);
    } else if (tfx == 205) {
        color = tfxRenderWielblikPryzmat(uv, texColor, tfxColor);
    } else if (tfx == 206) {
        color = tfxRenderMatrix(uv, texColor, tfxColor);
    } else if (tfx == 207) {
        color = tfxRenderHaker(uv, texColor, tfxColor);
    } else if (tfx == 208) {
        color = tfxRenderBinarny(uv, texColor, tfxColor);
    } else if (tfx == 209) {
        color = tfxRenderTerminal(uv, texColor, tfxColor);
    } else if (tfx == 210) {
        color = tfxRenderKod(uv, texColor, tfxColor);
    } else if (tfx == 211) {
        color = tfxRenderGlitchBinarny(uv, texColor, tfxColor);
    } else if (tfx == 212) {
        color = tfxRenderDeszczKodu(uv, texColor, tfxColor);
    } else if (tfx == 213) {
        color = tfxRenderZerojedynka(uv, texColor, tfxColor);
    } else if (tfx == 214) {
        color = tfxRenderCyber(uv, texColor, tfxColor);
    } else if (tfx == 215) {
        color = tfxRenderBackdoor(uv, texColor, tfxColor);
    } else if (tfx == 216) {
        color = tfxRenderLampaBiala(uv, texColor, tfxColor);
    } else if (tfx == 217) {
        color = tfxRenderLampaZlota(uv, texColor, tfxColor);
    } else if (tfx == 221) {
        color = tfxRenderLaserZielony(uv, texColor, tfxColor);
    } else if (tfx == 222) {
        color = tfxRenderLaserFioletowy(uv, texColor, tfxColor);
    } else if (tfx == 226) {
        color = tfxRenderFala2Morska(uv, texColor, tfxColor);
    } else if (tfx == 227) {
        color = tfxRenderFala2Lawendowa(uv, texColor, tfxColor);
    } else if (tfx == 231) {
        color = tfxRenderSkanerNeon(uv, texColor, tfxColor);
    } else if (tfx == 232) {
        color = tfxRenderSkanerPlazmowy(uv, texColor, tfxColor);
    } else if (tfx == 236) {
        color = tfxRenderGwiazdySnieg(uv, texColor, tfxColor);
    } else if (tfx == 237) {
        color = tfxRenderGwiazdyZloto(uv, texColor, tfxColor);
    } else if (tfx == 241) {
        color = tfxRenderPulsarKarmazyn(uv, texColor, tfxColor);
    } else if (tfx == 242) {
        color = tfxRenderPulsarNeonowy(uv, texColor, tfxColor);
    } else if (tfx == 246) {
        color = tfxRenderDrganieSiebie(uv, texColor, tfxColor);
    } else if (tfx == 247) {
        color = tfxRenderDrganieFali(uv, texColor, tfxColor);
    } else if (tfx == 251) {
        color = tfxRenderSkokWesoly(uv, texColor, tfxColor);
    } else if (tfx == 252) {
        color = tfxRenderSkokSprint(uv, texColor, tfxColor);
    } else if (tfx == 256) {
        color = tfxRenderWahadloZegar(uv, texColor, tfxColor);
    } else if (tfx == 257) {
        color = tfxRenderWahadloLuna(uv, texColor, tfxColor);
    } else if (tfx == 261) {
        color = tfxRenderWirGalaktyka(uv, texColor, tfxColor);
    } else if (tfx == 262) {
        color = tfxRenderWirOcean(uv, texColor, tfxColor);
    } else if (tfx == 266) {
        color = tfxRenderKapKropla(uv, texColor, tfxColor);
    } else if (tfx == 267) {
        color = tfxRenderKapWodny(uv, texColor, tfxColor);
    } else if (tfx == 271) {
        color = tfxRenderDryfChmura(uv, texColor, tfxColor);
    } else if (tfx == 272) {
        color = tfxRenderDryfZarny(uv, texColor, tfxColor);
    } else if (tfx == 276) {
        color = tfxRenderMatrixZielony(uv, texColor, tfxColor);
    } else if (tfx == 279) {
        color = tfxRenderMatrixFiolet(uv, texColor, tfxColor);
    } else if (tfx == 281) {
        color = tfxRenderPerla(uv, texColor, tfxColor);
    } else if (tfx == 282) {
        color = tfxRenderMgla(uv, texColor, tfxColor);
    } else if (tfx == 283) {
        color = tfxRenderSzafir(uv, texColor, tfxColor);
    } else if (tfx == 284) {
        color = tfxRenderRubin(uv, texColor, tfxColor);
    } else if (tfx == 285) {
        color = tfxRenderSzmaragd(uv, texColor, tfxColor);
    } else if (tfx == 286) {
        color = tfxRenderBursztyn(uv, texColor, tfxColor);
    } else if (tfx == 287) {
        color = tfxRenderLodowy(uv, texColor, tfxColor);
    } else if (tfx == 288) {
        color = tfxRenderIskry(uv, texColor, tfxColor);
    } else if (tfx == 289) {
        color = tfxRenderFalowanie(uv, texColor, tfxColor);
    } else if (tfx == 290) {
        color = tfxRenderPoziomice(uv, texColor, tfxColor);
    } else if (tfx == 291) {
        color = tfxRenderMetal(uv, texColor, tfxColor);
    } else if (tfx == 292) {
        color = tfxRenderWoda(uv, texColor, tfxColor);
    } else if (tfx == 293) {
        color = tfxRenderNoc(uv, texColor, tfxColor);
    } else if (tfx == 294) {
        color = tfxRenderPoranek(uv, texColor, tfxColor);
    } else if (tfx == 295) {
        color = tfxRenderPustynia(uv, texColor, tfxColor);
    } else if (tfx == 296) {
        color = tfxRenderWino(uv, texColor, tfxColor);
    } else if (tfx == 297) {
        color = tfxRenderSwieca(uv, texColor, tfxColor);
    } else if (tfx == 298) {
        color = tfxRenderChmura(uv, texColor, tfxColor);
    } else if (tfx == 299) {
        color = tfxRenderMech(uv, texColor, tfxColor);
    } else if (tfx == 300) {
        color = tfxRenderLawenda(uv, texColor, tfxColor);
    }

    if (color.a < 0.1) {
        discard;
    }

    fragColor = apply_fog(color, sphericalVertexDistance, cylindricalVertexDistance, FogEnvironmentalStart, FogEnvironmentalEnd, FogRenderDistanceStart, FogRenderDistanceEnd, FogColor);
}
