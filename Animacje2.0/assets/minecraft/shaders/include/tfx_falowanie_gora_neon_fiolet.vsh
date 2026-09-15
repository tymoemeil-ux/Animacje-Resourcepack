// ============================================================
// EFEKT (POLACZENIE): FALOWANIE_GORA_NEON_FIOLET   |   kolor spustowy: #80C0F4
// polaczenie: ruch falowanie_gora + kolor neon_fiolet
// ============================================================
if (c == ivec3(128, 192, 244)) {
        tfxIDg = 150.0;
        tfxOffg.y += sin(GameTime * 1.6 + g * 0.25) * 0.01;
}
