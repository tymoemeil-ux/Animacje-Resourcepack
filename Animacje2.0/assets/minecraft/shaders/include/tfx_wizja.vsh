// ============================================================
// EFEKT: WIZJA   |   kolor spustowy: #A0A0C8
// szybki flicker + scanlines, bialo-niebieska wizja (HYBRYDA: kolor + ruch)
// ============================================================
if (c == ivec3(160, 160, 200)) {
        tfxIDg = 75.0;
        float f = floor(GameTime * 25.0);
        tfxOffg.x += (tfxHash(vec2(f, 7.0)) - 0.5) * 0.008;
}
