// ============================================================
// EFEKT (RUCH): TRZESIENIE_PIONOWE   |   kolor spustowy: #80C010
// mocne trzesienie w gore i w dol, czerwon
// ============================================================
if (c == ivec3(128, 192, 16)) {
        tfxIDg = 93.0;
        float f = floor(GameTime * 28.0);
        tfxOffg.y += (tfxHash(vec2(f, g)) - 0.5) * 0.010;
}
