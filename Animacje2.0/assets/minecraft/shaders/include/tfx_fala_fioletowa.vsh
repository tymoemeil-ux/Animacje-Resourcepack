// ============================================================
// EFEKT: FALA_FIOLETOWA   |   kolor spustowy: #A0A088
// fioletowa fala z mieniacym sie purpura (HYBRYDA: kolor + ruch)
// ============================================================
if (c == ivec3(160, 160, 136)) {
        tfxIDg = 59.0;
        tfxOffg.y += sin(g * 0.55 - GameTime * 4.5) * 0.012;
}
