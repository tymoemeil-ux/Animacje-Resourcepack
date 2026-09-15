// ============================================================
// EFEKT (HYBRYDA: kolor + ruch): OGIEN   |   kolor spustowy: #A0A038
// ogien — iskrzace piksele, czerwien -> pomarancz -> zolty
// ============================================================
if (c == ivec3(160, 160, 56)) {
        tfxIDg = 27.0;
        tfxBaseg = vec4(1.0);
        tfxOffg.y += (tfxHash(vec2(floor(GameTime * 12.0), g)) - 0.5) * 0.006;
}
