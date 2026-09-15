// ============================================================
// EFEKT (POLACZENIE): DESZCZ_ZIEMI_RUBIN   |   kolor spustowy: #80C080
// polaczenie: ruch deszcz_ziemi + kolor rubin
// ============================================================
if (c == ivec3(128, 192, 128)) {
        tfxIDg = 121.0;
        float ph = fract(GameTime * 0.4);
        tfxOffg.y -= ph * 0.035;
}
