// ============================================================
// EFEKT (POLACZENIE): ZYGZAK_V2_NEONY_TOKIO   |   kolor spustowy: #80C090
// polaczenie: ruch zygzak_v2 + kolor neony_tokio
// ============================================================
if (c == ivec3(128, 192, 144)) {
        tfxIDg = 125.0;
        float tri = abs(fract(GameTime * 1.1 + g * 0.05) * 2.0 - 1.0) * 2.0 - 1.0;
        tfxOffg.y += tri * 0.016;
}
