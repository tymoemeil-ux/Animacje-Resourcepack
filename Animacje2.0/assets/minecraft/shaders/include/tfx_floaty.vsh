// ============================================================
// EFEKT: FLOATY   |   kolor spustowy: #60A0FF
// płynne uniesie — caly tekst powoli dryfuje w gore i w dol
// ============================================================
if (c == ivec3(96, 160, 255)) {
        tfxIDg = 47.0;
        tfxOffg.y += sin(GameTime * 2.0) * 0.009;
}
