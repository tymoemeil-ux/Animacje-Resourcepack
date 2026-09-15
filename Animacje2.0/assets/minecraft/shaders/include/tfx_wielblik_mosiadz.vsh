// ============================================================
// EFEKT (polaczenie: ruch wielblik + kolor mosiadz): WIELBLIK_MOSIADZ   |   kolor spustowy: #60D020
// wielblik_mosiadz
// ============================================================
if (c == ivec3(96, 208, 32)) {
        tfxIDg = 194.0;

    float t = GameTime * 0.7;
    tfxOffg.y += sin(t * 2.0 - g * 0.25) * 0.020;
    tfxOffg.x += cos(t - g * 0.18) * 0.008;
}
