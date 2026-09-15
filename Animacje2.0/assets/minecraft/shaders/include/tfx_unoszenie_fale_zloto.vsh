// ============================================================
// EFEKT (POLACZENIE): UNOSZENIE_FALE_ZLOTO   |   kolor spustowy: #80C0FC
// polaczenie: ruch unoszenie_fale + kolor zloto
// ============================================================
if (c == ivec3(128, 192, 252)) {
        tfxIDg = 152.0;
        tfxOffg.y += sin(GameTime * 2.2 + tfxPos.x * 0.06) * 0.011;
}
