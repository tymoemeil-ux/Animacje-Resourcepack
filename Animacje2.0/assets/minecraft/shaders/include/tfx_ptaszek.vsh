// ============================================================
// EFEKT (ruch: ptaszek (HYBRYDA)): PTASZEK   |   kolor spustowy: #60B028
// ptaszek
// ============================================================
if (c == ivec3(96, 176, 40)) {
        tfxIDg = 166.0;

    float t = GameTime * 4.5;
    tfxOffg.y += sin(t + g * 0.8) * 0.008 + sin(GameTime * 0.9 + g * 0.4) * 0.006;
    tfxOffg.x += cos(t * 0.5 + g * 1.2) * 0.003;
}
