// ============================================================
// EFEKT: FLICKER   |   kolor spustowy: #F0F0F0
// znaki migniaja (znikaja i wracaja)
// ============================================================
if (c == ivec3(240, 240, 240)) {
        tfxIDg = 24.0;
        if (tfxHash(vec2(g, floor(GameTime * 14.0))) < 0.28) {
            tfxAlphag = 0.0;
        }
}
