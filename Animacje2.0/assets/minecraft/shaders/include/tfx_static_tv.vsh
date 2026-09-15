// ============================================================
// EFEKT (HYBRYDA: kolor + ruch): STATIC TV   |   kolor spustowy: #A0A064
// szum telewizyjny — losowy szum pikselowy co klatke
// ============================================================
if (c == ivec3(160, 160, 100)) {
        tfxIDg = 38.0;
        tfxBaseg = vec4(1.0);
        tfxOffg.x += (tfxHash(vec2(floor(GameTime * 30.0), 9.0)) - 0.5) * 0.005;
}
