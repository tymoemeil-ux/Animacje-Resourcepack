// ============================================================
// EFEKT (HYBRYDA: kolor + ruch): TECAFALA   |   kolor spustowy: #A0A008
// przesuwajaca sie taca barw
// ============================================================
if (c == ivec3(160, 160, 8)) {
        tfxIDg = 3.0;
        tfxBaseg = vec4(1.0);
        tfxOffg.x += sin(GameTime * 3.0 + g * 0.3) * 0.006;
}
