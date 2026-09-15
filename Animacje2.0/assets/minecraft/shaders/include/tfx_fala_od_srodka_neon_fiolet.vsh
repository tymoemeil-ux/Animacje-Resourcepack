// ============================================================
// EFEKT (POLACZENIE): FALA_OD_SRODKA_NEON_FIOLET   |   kolor spustowy: #80C0B4
// polaczenie: ruch fala_od_srodka + kolor neon_fiolet
// ============================================================
if (c == ivec3(128, 192, 180)) {
        tfxIDg = 134.0;
        tfxOffg.y += sin(g * 0.4 - GameTime * 4.0) * 0.010 * (0.5 + 0.5 * sin(GameTime * 0.5 + g * 0.12));
}
