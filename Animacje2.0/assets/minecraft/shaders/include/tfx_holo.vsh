// ============================================================
// EFEKT (HYBRYDA: kolor + ruch): HOLO   |   kolor spustowy: #A0A060
// hologram — scanlines, rolujacy pas, losowe spadki sygnalu
// ============================================================
if (c == ivec3(160, 160, 96)) {
        tfxIDg = 37.0;
        tfxBaseg = vec4(1.0);
        tfxOffg.y += sin(GameTime * 8.0) * 0.003;
}
