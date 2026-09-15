// ============================================================
// EFEKT (POLACZENIE): BUNGEE_NEON_CYJAN   |   kolor spustowy: #80C0B8
// polaczenie: ruch bungee + kolor neon_cyjan
// ============================================================
if (c == ivec3(128, 192, 184)) {
        tfxIDg = 135.0;
        float ph = fract(GameTime * 0.6);
        float a = ph < 0.35 ? min(ph / 0.35, 1.0) : exp((0.35 - ph) * 4.0) * cos((ph - 0.35) * 18.0);
        tfxOffg.y -= a * 0.035;
}
