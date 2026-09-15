// ============================================================
// EFEKT (HYBRYDA: kolor + ruch): NEONFALA   |   kolor spustowy: #A0A004
// neonowa fala kolorow
// ============================================================
if (c == ivec3(160, 160, 4)) {
        tfxIDg = 2.0;
        tfxBaseg = vec4(1.0);
        tfxOffg.y += sin(g * 0.5 - GameTime * 4.0) * 0.007;
}
