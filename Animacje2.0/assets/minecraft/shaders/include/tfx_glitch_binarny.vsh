// ============================================================
// EFEKT (HAKER): GLITCH_BINARNY   |   kolor spustowy: #211014
// glitch: poziome plastry zieleń ↔ biel
// ============================================================
if (c == ivec3(33, 16, 20)) {
        tfxIDg = 211.0;
    tfxOffg.x += (tfxHash(vec2(floor(GameTime * 12.0), g)) - 0.5) * 0.006;
}
