// ============================================================
// EFEKT (POLACZENIE): TRZESIENIE_PIONOWE_PLATYNA   |   kolor spustowy: #80D000
// polaczenie: ruch trzesienie_pionowe + kolor platyna
// ============================================================
if (c == ivec3(128, 208, 0)) {
        tfxIDg = 153.0;
        float f = floor(GameTime * 28.0);
        tfxOffg.y += (tfxHash(vec2(f, g)) - 0.5) * 0.010;
}
