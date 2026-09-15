// ============================================================
// EFEKT (POLACZENIE): DESZCZ_ZIEMI_NEONY_TOKIO   |   kolor spustowy: #80C0D0
// polaczenie: ruch deszcz_ziemi + kolor neony_tokio
// ============================================================
if (c == ivec3(128, 192, 208)) {
        tfxIDg = 141.0;
        float ph = fract(GameTime * 0.4);
        tfxOffg.y -= ph * 0.035;
}
