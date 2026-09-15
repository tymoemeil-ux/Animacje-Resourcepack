// ============================================================
// EFEKT: KARUZELA   |   kolor spustowy: #FF9030
// znaki kruja w kregu
// ============================================================
if (c == ivec3(255, 144, 48)) {
        tfxIDg = 19.0;
        {
            float a = GameTime * 4.5 + g * 0.85;
            tfxOffg.x += sin(a) * 0.012;
            tfxOffg.y += cos(a) * 0.018;
        }
}
