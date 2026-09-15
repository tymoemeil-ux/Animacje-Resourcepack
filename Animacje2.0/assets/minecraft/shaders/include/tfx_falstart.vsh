// ============================================================
// EFEKT (RUCH): FALSTART   |   kolor spustowy: #A0A0D8
// ostra fala z jednostronnymi grzbietami, pomarancz
// ============================================================
if (c == ivec3(160, 160, 216)) {
        tfxIDg = 79.0;
        tfxOffg.y += pow(max(0.0, sin(g * 0.6 - GameTime * 5.0)), 2.0) * 0.02;
}
