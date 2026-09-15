// ============================================================
// EFEKT (POLACZENIE): WIBROWANIE_MIEDZ   |   kolor spustowy: #80C074
// polaczenie: ruch wibrowanie + kolor miedz
// ============================================================
if (c == ivec3(128, 192, 116)) {
        tfxIDg = 118.0;
        tfxOffg.x += sin(GameTime * 18.0 + g * 0.2) * 0.005;
}
