// ============================================================
// EFEKT (RUCH): PULS_ZER   |   kolor spustowy: #A0A0FC
// pulsowanie w bok z modulacja, szkarlat
// ============================================================
if (c == ivec3(160, 160, 252)) {
        tfxIDg = 88.0;
        tfxOffg.x += sin(GameTime * 5.0) * 0.008 * (1.0 + 0.3 * sin(GameTime * 0.7));
}
