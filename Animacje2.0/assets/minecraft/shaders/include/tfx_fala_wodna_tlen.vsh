// ============================================================
// EFEKT (POLACZENIE): FALA_WODNA_TLEN   |   kolor spustowy: #80C0DC
// polaczenie: ruch fala_wodna + kolor tlen
// ============================================================
if (c == ivec3(128, 192, 220)) {
        tfxIDg = 144.0;
        float t = GameTime;
        tfxOffg.y += sin(tfxPos.x * 0.08 - t * 3.0) * cos(t * 1.3) * 0.012;
}
