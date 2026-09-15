// ============================================================
// EFEKT (POLACZENIE): WACHLARZ_PERLA   |   kolor spustowy: #80C0CC
// polaczenie: ruch wachlarz + kolor perla
// ============================================================
if (c == ivec3(128, 192, 204)) {
        tfxIDg = 140.0;
        tfxOffg.y += sin(GameTime * 2.5 + g * 0.9) * 0.008 * (1.0 + 0.5 * sin(g * 0.31));
}
