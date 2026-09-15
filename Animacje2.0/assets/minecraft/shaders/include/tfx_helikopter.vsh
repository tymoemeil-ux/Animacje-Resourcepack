// ============================================================
// EFEKT (RUCH): HELIKOPTER   |   kolor spustowy: #A0A0CC
// znaki lecia jak helikopter (osmiotaka), czerwone swiatlo
// ============================================================
if (c == ivec3(160, 160, 204)) {
        tfxIDg = 76.0;
        float ph = GameTime * 3.0 + g * 0.35;
        tfxOffg.x += cos(ph) * 0.010;
        tfxOffg.y += sin(ph * 2.0) * 0.007;
}
