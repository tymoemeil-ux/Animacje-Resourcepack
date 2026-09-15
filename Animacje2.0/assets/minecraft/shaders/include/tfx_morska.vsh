// ============================================================
// EFEKT: MORSKA   |   kolor spustowy: #A0A0C0
// duza wolna morska fala, gleboki niebieski (HYBRYDA: kolor + ruch)
// ============================================================
if (c == ivec3(160, 160, 192)) {
        tfxIDg = 73.0;
        tfxOffg.y += sin(g * 0.3 - GameTime * 1.8) * 0.02;
}
