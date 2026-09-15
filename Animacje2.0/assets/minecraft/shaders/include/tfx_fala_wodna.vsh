// ============================================================
// EFEKT (RUCH): FALA_WODNA   |   kolor spustowy: #A0A0EC
// dwuwymiarowa fala wodna, morska zieleń
// ============================================================
if (c == ivec3(160, 160, 236)) {
        tfxIDg = 84.0;
        float t = GameTime;
        tfxOffg.y += sin(tfxPos.x * 0.08 - t * 3.0) * cos(t * 1.3) * 0.012;
}
