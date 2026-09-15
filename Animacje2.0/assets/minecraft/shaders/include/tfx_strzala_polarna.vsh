// ============================================================
// EFEKT (polaczenie: ruch strzala + kolor polarna): STRZALA_POLARNA   |   kolor spustowy: #60D008
// strzala_polarna
// ============================================================
if (c == ivec3(96, 208, 8)) {
        tfxIDg = 188.0;

    float ph = fract(GameTime * 0.9 + g * 0.07);
    float s = smoothstep(0.0, 0.12, ph) * (1.0 - smoothstep(0.3, 0.55, ph));
    tfxOffg.y -= s * 0.022;
}
