// ============================================================
// EFEKT (POLACZENIE): WIELKIE_KOLO_NEON_AMBER   |   kolor spustowy: #80C0A0
// polaczenie: ruch wielkie_kolo + kolor neon_amber
// ============================================================
if (c == ivec3(128, 192, 160)) {
        tfxIDg = 129.0;
        float ph = GameTime * 0.8 + g * 0.2;
        tfxOffg.x += cos(ph) * 0.02;
        tfxOffg.y += sin(ph) * 0.02;
}
