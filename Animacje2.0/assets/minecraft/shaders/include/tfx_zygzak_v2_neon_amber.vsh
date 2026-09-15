// ============================================================
// EFEKT (POLACZENIE): ZYGZAK_V2_NEON_AMBER   |   kolor spustowy: #80C0E0
// polaczenie: ruch zygzak_v2 + kolor neon_amber
// ============================================================
if (c == ivec3(128, 192, 224)) {
        tfxIDg = 145.0;
        float tri = abs(fract(GameTime * 1.1 + g * 0.05) * 2.0 - 1.0) * 2.0 - 1.0;
        tfxOffg.y += tri * 0.016;
}
