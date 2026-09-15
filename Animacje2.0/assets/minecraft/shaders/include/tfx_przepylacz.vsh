// ============================================================
// EFEKT (ruch: przepylacz (HYBRYDA)): PRZEPYLACZ   |   kolor spustowy: #60B01C
// przepylacz
// ============================================================
if (c == ivec3(96, 176, 28)) {
        tfxIDg = 163.0;

    float t = GameTime * 7.0;
    tfxOffg.x += (tfxHash(vec2(floor(t), g)) - 0.5) * 0.006;
    tfxOffg.y += sin(t * 1.7 + g * 3.1) * 0.004;
}
