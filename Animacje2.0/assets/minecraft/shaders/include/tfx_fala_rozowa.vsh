// ============================================================
// EFEKT: FALA_ROZOWA   |   kolor spustowy: #A0A09C
// rozowa fala neonowa (HYBRYDA: kolor + ruch)
// ============================================================
if (c == ivec3(160, 160, 156)) {
        tfxIDg = 64.0;
        tfxOffg.y += sin(g * 0.5 - GameTime * 3.2) * 0.012;
}
