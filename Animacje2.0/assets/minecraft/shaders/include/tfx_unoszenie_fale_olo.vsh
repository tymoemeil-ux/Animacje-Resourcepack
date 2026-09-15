// ============================================================
// EFEKT (POLACZENIE): UNOSZENIE_FALE_OLO   |   kolor spustowy: #80C0AC
// polaczenie: ruch unoszenie_fale + kolor olo
// ============================================================
if (c == ivec3(128, 192, 172)) {
        tfxIDg = 132.0;
        tfxOffg.y += sin(GameTime * 2.2 + tfxPos.x * 0.06) * 0.011;
}
