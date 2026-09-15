// ============================================================
// EFEKT (POLACZENIE): SZARPACZE_FALE_NEON_CYJAN   |   kolor spustowy: #80C0F8
// polaczenie: ruch szarpacze_fale + kolor neon_cyjan
// ============================================================
if (c == ivec3(128, 192, 248)) {
        tfxIDg = 151.0;
        float s = sign(sin(g * 0.5 - GameTime * 3.0));
        tfxOffg.y += s * smoothstep(0.0, 0.25, abs(s)) * 0.014;
}
