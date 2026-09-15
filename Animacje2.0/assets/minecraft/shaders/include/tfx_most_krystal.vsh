// ============================================================
// EFEKT (polaczenie: ruch most + kolor krystal): MOST_KRYSTAL   |   kolor spustowy: #60D040
// most_krystal
// ============================================================
if (c == ivec3(96, 208, 64)) {
        tfxIDg = 202.0;

    float t = GameTime * 2.2;
    float w = 0.5 + 0.5 * sin(t * 1.4 - g * 0.55);
    tfxOffg.y -= w * w * 0.030;
    tfxOffg.x += (w - 0.5) * 0.010;
}
