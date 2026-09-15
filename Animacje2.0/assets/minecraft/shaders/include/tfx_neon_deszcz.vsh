// ============================================================
// EFEKT: NEON_DESZCZ   |   kolor spustowy: #A0A080
// znaki spadaja jak krople, cyjanowe smugi swiatla (HYBRYDA: kolor + ruch)
// ============================================================
if (c == ivec3(160, 160, 128)) {
        tfxIDg = 57.0;
        float ph = fract(GameTime * 1.8 + g * 0.15);
        tfxOffg.y -= ph * 0.05;
}
