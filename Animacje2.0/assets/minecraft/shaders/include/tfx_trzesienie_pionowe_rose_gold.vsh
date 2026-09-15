// ============================================================
// EFEKT (POLACZENIE): TRZESIENIE_PIONOWE_ROSE_GOLD   |   kolor spustowy: #80C0B0
// polaczenie: ruch trzesienie_pionowe + kolor rose_gold
// ============================================================
if (c == ivec3(128, 192, 176)) {
        tfxIDg = 133.0;
        float f = floor(GameTime * 28.0);
        tfxOffg.y += (tfxHash(vec2(f, g)) - 0.5) * 0.010;
}
