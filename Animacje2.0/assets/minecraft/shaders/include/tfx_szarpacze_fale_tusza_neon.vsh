// ============================================================
// EFEKT (POLACZENIE): SZARPACZE_FALE_TUSZA_NEON   |   kolor spustowy: #80C0A8
// polaczenie: ruch szarpacze_fale + kolor tusza_neon
// ============================================================
if (c == ivec3(128, 192, 168)) {
        tfxIDg = 131.0;
        float s = sign(sin(g * 0.5 - GameTime * 3.0));
        tfxOffg.y += s * smoothstep(0.0, 0.25, abs(s)) * 0.014;
}
