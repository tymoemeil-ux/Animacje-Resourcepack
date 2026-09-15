// ============================================================
// EFEKT: BUMPER   |   kolor spustowy: #FF30A0
// znaki odbijaja sie jak bilard
// ============================================================
if (c == ivec3(255, 48, 160)) {
        tfxIDg = 21.0;
        {
            float step = floor(GameTime * 3.5);
            tfxOffg.x += (tfxHash(vec2(g * 2.3, step)) - 0.5) * 0.050;
            tfxOffg.y += (tfxHash(vec2(g * 4.9, step + 7.0)) - 0.5) * 0.035;
        }
}
