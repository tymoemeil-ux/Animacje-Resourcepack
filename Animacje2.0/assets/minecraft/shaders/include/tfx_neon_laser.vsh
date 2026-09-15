// ============================================================
// EFEKT: NEON_LASER   |   kolor spustowy: #A0A0B8
// fala + czerwony laser skanujacy pionowo (HYBRYDA: kolor + ruch)
// ============================================================
if (c == ivec3(160, 160, 184)) {
        tfxIDg = 71.0;
        tfxOffg.y += sin(g * 0.4 - GameTime * 6.0) * 0.008;
        tfxOffg.x += (tfxHash(vec2(floor(GameTime * 12.0), g)) - 0.5) * 0.006;
}
