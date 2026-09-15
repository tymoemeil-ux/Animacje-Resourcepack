// ============================================================
// EFEKT (HYBRYDA: kolor + ruch): GLOW   |   kolor spustowy: #A0A05C
// zloty swiatl, co delikatnie oddycha (pulswanie jasnosci)
// ============================================================
if (c == ivec3(160, 160, 92)) {
        tfxIDg = 36.0;
        tfxBaseg = vec4(1.0);
        tfxOffg.y += sin(GameTime * 2.6) * 0.007;
}
