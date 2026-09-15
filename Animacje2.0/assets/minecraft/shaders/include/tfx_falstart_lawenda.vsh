// ============================================================
// EFEKT (POLACZENIE): FALSTART_LAWENDA   |   kolor spustowy: #80C078
// polaczenie: ruch falstart + kolor lawenda
// ============================================================
if (c == ivec3(128, 192, 120)) {
        tfxIDg = 119.0;
        tfxOffg.y += pow(max(0.0, sin(g * 0.6 - GameTime * 5.0)), 2.0) * 0.02;
}
