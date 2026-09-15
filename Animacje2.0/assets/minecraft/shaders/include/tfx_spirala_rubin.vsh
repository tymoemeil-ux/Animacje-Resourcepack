// ============================================================
// EFEKT (POLACZENIE): SPIRALA_RUBIN   |   kolor spustowy: #80C0C0
// polaczenie: ruch spirala + kolor rubin
// ============================================================
if (c == ivec3(128, 192, 192)) {
        tfxIDg = 137.0;
        float ph = GameTime * 2.0 + g * 0.3;
        float r = 0.006 + 0.005 * (0.5 + 0.5 * sin(GameTime * 0.7));
        tfxOffg.x += cos(ph) * r;
        tfxOffg.y += sin(ph) * r * 0.7;
}
