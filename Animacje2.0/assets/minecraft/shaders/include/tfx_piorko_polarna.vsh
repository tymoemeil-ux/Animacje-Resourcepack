// ============================================================
// EFEKT (polaczenie: ruch piorko + kolor polarna): PIORKO_POLARNA   |   kolor spustowy: #60D044
// piorko_polarna
// ============================================================
if (c == ivec3(96, 208, 68)) {
        tfxIDg = 203.0;

    float t = GameTime * 1.1;
    float fl = sin(t * 6.0 + g * 2.4) * 0.0015;
    tfxOffg.y += sin(t + g * 1.7) * 0.012 + fl;
    tfxOffg.x += cos(t * 0.7 + g * 1.1) * 0.006;
}
