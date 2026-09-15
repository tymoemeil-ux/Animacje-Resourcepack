// ============================================================
// EFEKT (POLACZENIE): FALSTART_TOPAZ   |   kolor spustowy: #80C0C8
// polaczenie: ruch falstart + kolor topaz
// ============================================================
if (c == ivec3(128, 192, 200)) {
        tfxIDg = 139.0;
        tfxOffg.y += pow(max(0.0, sin(g * 0.6 - GameTime * 5.0)), 2.0) * 0.02;
}
