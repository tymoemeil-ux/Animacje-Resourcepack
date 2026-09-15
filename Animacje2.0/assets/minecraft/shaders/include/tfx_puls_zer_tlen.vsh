// ============================================================
// EFEKT (POLACZENIE): PULS_ZER_TLEN   |   kolor spustowy: #80C09C
// polaczenie: ruch puls_zer + kolor tlen
// ============================================================
if (c == ivec3(128, 192, 156)) {
        tfxIDg = 128.0;
        tfxOffg.x += sin(GameTime * 5.0) * 0.008 * (1.0 + 0.3 * sin(GameTime * 0.7));
}
