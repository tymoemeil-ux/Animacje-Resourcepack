// ============================================================
// EFEKT (POLACZENIE): FALA_OD_SRODKA_MIEDZ   |   kolor spustowy: #80D004
// polaczenie: ruch fala_od_srodka + kolor miedz
// ============================================================
if (c == ivec3(128, 208, 4)) {
        tfxIDg = 154.0;
        tfxOffg.y += sin(g * 0.4 - GameTime * 4.0) * 0.010 * (0.5 + 0.5 * sin(GameTime * 0.5 + g * 0.12));
}
