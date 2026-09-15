// ============================================================
// EFEKT (POLACZENIE): DRGANIA_MUZYCZNE_TUSZA_NEON   |   kolor spustowy: #80C0E8
// polaczenie: ruch drgania_muzyczne + kolor tusza_neon
// ============================================================
if (c == ivec3(128, 192, 232)) {
        tfxIDg = 147.0;
        float ph = fract(GameTime);
        float beat = pow(max(0.0, 1.0 - ph * 4.0), 3.0);
        tfxOffg.y -= beat * 0.02;
}
