// ============================================================
// EFEKT: WYSKOK   |   kolor spustowy: #A0A0AC
// wielki powolny skok calego tekstu, pomaranczowy zachod (HYBRYDA: kolor + ruch)
// ============================================================
if (c == ivec3(160, 160, 172)) {
        tfxIDg = 68.0;
        float ph = fract(GameTime * 0.5);
        float b = sin(min(ph / 0.5, 1.0) * 3.14159);
        tfxOffg.y += b * b * 0.05;
}
