// ============================================================
// EFEKT: HEARTBEAT   |   kolor spustowy: #FF3030
// cały tekst bije jak serce
// ============================================================
if (c == ivec3(255, 48, 48)) {
        tfxIDg = 23.0;
        {
            float t = fract(GameTime * 1.1);
            float hb = exp(-9.0 * t) + 0.55 * exp(-9.0 * max(t - 0.28, 0.0));
            tfxOffg.y -= min(hb, 1.5) * 0.022;
            tfxOffg.x += (tfxHash(vec2(g, 1.0)) - 0.5) * min(hb, 1.5) * 0.004;
        }
}
