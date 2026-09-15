// ============================================================
// EFEKT (HYBRYDA: kolor + ruch): NEON   |   kolor spustowy: #A0A01C
// pulsujace swiatlo neonowe
// ============================================================
if (c == ivec3(160, 160, 28)) {
        tfxIDg = 8.0;
        tfxBaseg = vec4(1.0);
        tfxOffg.y += sin(GameTime * 3.0 + g * 0.25) * 0.006;
}
