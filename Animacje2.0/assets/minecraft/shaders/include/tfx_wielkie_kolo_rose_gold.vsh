// ============================================================
// EFEKT (POLACZENIE): WIELKIE_KOLO_ROSE_GOLD   |   kolor spustowy: #80C0F0
// polaczenie: ruch wielkie_kolo + kolor rose_gold
// ============================================================
if (c == ivec3(128, 192, 240)) {
        tfxIDg = 149.0;
        float ph = GameTime * 0.8 + g * 0.2;
        tfxOffg.x += cos(ph) * 0.02;
        tfxOffg.y += sin(ph) * 0.02;
}
