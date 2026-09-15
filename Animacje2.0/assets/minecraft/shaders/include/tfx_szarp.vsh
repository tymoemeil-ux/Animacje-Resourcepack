// ============================================================
// EFEKT: SZARP   |   kolor spustowy: #00B0B0
// szarpanie — ciagle szybkie przesuwanie w prawo i w lewo
// ============================================================
if (c == ivec3(0, 176, 176)) {
        tfxIDg = 50.0;
        float tri = abs(fract(GameTime * 1.3 + g * 0.03) * 2.0 - 1.0) * 2.0 - 1.0;
        tfxOffg.x += tri * 0.018;
}
