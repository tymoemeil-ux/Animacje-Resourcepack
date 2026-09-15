// ============================================================
// EFEKT (ruch: deszczyk (HYBRYDA)): DESZCZYK   |   kolor spustowy: #60B024
// deszczyk
// ============================================================
if (c == ivec3(96, 176, 36)) {
        tfxIDg = 165.0;

    float t = GameTime * 1.3;
    float f = fract(t * 0.35 + g * 0.21);
    tfxOffg.y -= f * 0.030;
    tfxOffg.x += sin(g * 4.7 + t * 2.0) * 0.003;
}
