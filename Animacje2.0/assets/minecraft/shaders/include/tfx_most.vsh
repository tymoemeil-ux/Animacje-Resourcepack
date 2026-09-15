// ============================================================
// EFEKT (ruch: most (HYBRYDA)): MOST   |   kolor spustowy: #60B00C
// most
// ============================================================
if (c == ivec3(96, 176, 12)) {
        tfxIDg = 159.0;

    float t = GameTime * 2.2;
    float w = 0.5 + 0.5 * sin(t * 1.4 - g * 0.55);
    tfxOffg.y -= w * w * 0.030;
    tfxOffg.x += (w - 0.5) * 0.010;
}
