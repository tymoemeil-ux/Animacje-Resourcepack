// ============================================================
// EFEKT (HYBRYDA: kolor + ruch): NEON GRAD   |   kolor spustowy: #A0A04C
// neonowy gradient — pasmo odcienia przetacza sie przez tekst
// ============================================================
if (c == ivec3(160, 160, 76)) {
        tfxIDg = 32.0;
        tfxBaseg = vec4(1.0);
        tfxOffg.y += sin(g * 0.5 - GameTime * 3.5) * 0.006;
}
