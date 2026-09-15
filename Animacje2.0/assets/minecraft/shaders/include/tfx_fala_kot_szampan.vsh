// ============================================================
// EFEKT (polaczenie: ruch fala_kot + kolor szampan): FALA_KOT_SZAMPAN   |   kolor spustowy: #60D018
// fala_kot_szampan
// ============================================================
if (c == ivec3(96, 208, 24)) {
        tfxIDg = 192.0;

    float t = GameTime * 2.0;
    tfxOffg.y += sin(t * 2.4 - g * 0.8) * 0.011;
    tfxOffg.x += sin(t * 1.2 - g * 1.1) * 0.005;
}
