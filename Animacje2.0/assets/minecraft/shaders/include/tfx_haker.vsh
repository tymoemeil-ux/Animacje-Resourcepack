// ============================================================
// EFEKT (HAKER): HAKER   |   kolor spustowy: #211004
// zielony flicker + szum bitowy
// ============================================================
if (c == ivec3(33, 16, 4)) {
        tfxIDg = 207.0;
    tfxOffg.x += (tfxHash(vec2(floor(GameTime * 10.0), g)) - 0.5) * 0.003;
}
