// ============================================================
// EFEKT (RUCH): UNOSZENIE_FALE   |   kolor spustowy: #80C00C
// plyne z falowaniem po tekscie, cyjan
// ============================================================
if (c == ivec3(128, 192, 12)) {
        tfxIDg = 92.0;
        tfxOffg.y += sin(GameTime * 2.2 + tfxPos.x * 0.06) * 0.011;
}
