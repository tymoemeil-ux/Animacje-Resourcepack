// ============================================================
// EFEKT: GLITCH_HARD   |   kolor spustowy: #FF3050
// znaki szarpija sie losowo
// ============================================================
if (c == ivec3(255, 48, 80)) {
        tfxIDg = 17.0;
        {
            float step = floor(GameTime * 12.0);
            if (tfxHash(vec2(g * 3.1, step)) < 0.45) {
                tfxOffg.x += (tfxHash(vec2(g * 5.7, step + 1.0)) - 0.5) * 0.026;
                tfxOffg.y += (tfxHash(vec2(g * 7.3, step + 2.0)) - 0.5) * 0.011;
            }
        }
}
