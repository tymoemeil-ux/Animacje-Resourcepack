// ============================================================
// EFEKT (HYBRYDA: kolor + ruch): ZLOTY_BLASK   |   kolor spustowy: #A0A024
// zloty blask
// ============================================================
if (c == ivec3(160, 160, 36)) {
        tfxIDg = 10.0;
        tfxBaseg = vec4(1.0);
        tfxOffg.y += sin(GameTime * 2.2 + g * 0.3) * 0.005;
}
