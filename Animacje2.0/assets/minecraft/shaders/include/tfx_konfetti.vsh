// ============================================================
// EFEKT: KONFETTI   |   kolor spustowy: #A0A084
// znaki skacza losowo jak konfetti, losowe jasne kolory (HYBRYDA: kolor + ruch)
// ============================================================
if (c == ivec3(160, 160, 132)) {
        tfxIDg = 58.0;
        float f = floor(GameTime * 6.0);
        tfxOffg.x += (tfxHash(vec2(f, g)) - 0.5) * 0.016;
        tfxOffg.y += (tfxHash(vec2(f, g + 1.0)) - 0.5) * 0.016;
}
