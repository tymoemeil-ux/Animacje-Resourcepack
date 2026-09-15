// ============================================================
// EFEKT (RUCH): FALA_OD_SRODKA   |   kolor spustowy: #80C014
// fala z pulsuujaca amplituda, niebiesko-fiolet
// ============================================================
if (c == ivec3(128, 192, 20)) {
        tfxIDg = 94.0;
        tfxOffg.y += sin(g * 0.4 - GameTime * 4.0) * 0.010 * (0.5 + 0.5 * sin(GameTime * 0.5 + g * 0.12));
}
