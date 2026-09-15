// ============================================================
// EFEKT: FALA_ZIELONA   |   kolor spustowy: #A0A098
// zielona fala neonowa (HYBRYDA: kolor + ruch)
// ============================================================
if (c == ivec3(160, 160, 152)) {
        tfxIDg = 63.0;
        tfxOffg.y += sin(g * 0.5 - GameTime * 4.0) * 0.012;
}
