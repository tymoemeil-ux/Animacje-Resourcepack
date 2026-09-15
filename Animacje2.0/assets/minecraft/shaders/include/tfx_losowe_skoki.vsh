// ============================================================
// EFEKT (RUCH): LOSOWE_SKOKI   |   kolor spustowy: #A0A0E8
// znaki teleporutuja losowo co 0.25s, neon zielen
// ============================================================
if (c == ivec3(160, 160, 232)) {
        tfxIDg = 83.0;
        float f = floor(GameTime * 4.0);
        tfxOffg.x += (tfxHash(vec2(f, g)) - 0.5) * 0.02;
        tfxOffg.y += (tfxHash(vec2(f, g + 2.0)) - 0.5) * 0.02;
}
