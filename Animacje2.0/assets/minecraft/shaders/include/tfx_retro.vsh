// ============================================================
// EFEKT (KOLOR): RETRO   |   kolor spustowy: #80C04C
// retro VHS — magenta/cyjan + szum
// ============================================================
if (c == ivec3(128, 192, 76)) {
        tfxIDg = 108.0;
        float f = floor(GameTime * 12.0);
        tfxOffg.x += (tfxHash(vec2(f, g)) - 0.5) * 0.006;
}
