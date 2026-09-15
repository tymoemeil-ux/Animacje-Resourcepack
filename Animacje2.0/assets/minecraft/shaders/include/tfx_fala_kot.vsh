// ============================================================
// EFEKT (ruch: fala_kot (HYBRYDA)): FALA_KOT   |   kolor spustowy: #60B018
// fala_kot
// ============================================================
if (c == ivec3(96, 176, 24)) {
        tfxIDg = 162.0;

    float t = GameTime * 2.0;
    tfxOffg.y += sin(t * 2.4 - g * 0.8) * 0.011;
    tfxOffg.x += sin(t * 1.2 - g * 1.1) * 0.005;
}
