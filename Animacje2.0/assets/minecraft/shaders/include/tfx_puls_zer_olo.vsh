// ============================================================
// EFEKT (POLACZENIE): PULS_ZER_OLO   |   kolor spustowy: #80C0EC
// polaczenie: ruch puls_zer + kolor olo
// ============================================================
if (c == ivec3(128, 192, 236)) {
        tfxIDg = 148.0;
        tfxOffg.x += sin(GameTime * 5.0) * 0.008 * (1.0 + 0.3 * sin(GameTime * 0.7));
}
