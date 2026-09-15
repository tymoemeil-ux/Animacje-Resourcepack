// ============================================================
// EFEKT (POLACZENIE): WZNOSZENIE_SZAFIR   |   kolor spustowy: #80C084
// polaczenie: ruch wznoszenie + kolor szafir
// ============================================================
if (c == ivec3(128, 192, 132)) {
        tfxIDg = 122.0;
        float ph = fract(GameTime * 0.5);
        tfxOffg.y += ph * 0.03;
        tfxOffg.x += sin(ph * 6.28 + g) * 0.003;
}
