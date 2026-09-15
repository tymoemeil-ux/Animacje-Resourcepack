// ============================================================
// EFEKT: RAINBOW   |   kolor spustowy: #FF40FF
// kolejne znaki zmieniaja kolor (taca)
// ============================================================
if (c == ivec3(255, 64, 255)) {
        tfxIDg = 16.0;
        tfxTintg = tfxHsv(fract(g * 0.07 - GameTime * 0.22), 1.0, 1.0);
}
