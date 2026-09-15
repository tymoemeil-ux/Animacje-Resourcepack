// ============================================================
// EFEKT (HYBRYDA: kolor + ruch): LASER2   |   kolor spustowy: #A0A010
// poziomy snop lasera
// ============================================================
if (c == ivec3(160, 160, 16)) {
        tfxIDg = 5.0;
        tfxBaseg = vec4(0.30, 0.36, 0.44, 1.0);
        tfxOffg.x += (tfxHash(vec2(floor(GameTime * 10.0), g)) - 0.5) * 0.008;
}
