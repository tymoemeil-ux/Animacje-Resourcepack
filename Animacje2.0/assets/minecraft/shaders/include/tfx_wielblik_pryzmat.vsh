// ============================================================
// EFEKT (polaczenie: ruch wielblik + kolor pryzmat): WIELBLIK_PRYZMAT   |   kolor spustowy: #60D04C
// wielblik_pryzmat
// ============================================================
if (c == ivec3(96, 208, 76)) {
        tfxIDg = 205.0;

    float t = GameTime * 0.7;
    tfxOffg.y += sin(t * 2.0 - g * 0.25) * 0.020;
    tfxOffg.x += cos(t - g * 0.18) * 0.008;
}
