// ============================================================
// EFEKT (RUCH): DRGANIA_MUZYCZNE   |   kolor spustowy: #A0A0F8
// kop w dol przy kazdym bicie (1 Hz), magenta
// ============================================================
if (c == ivec3(160, 160, 248)) {
        tfxIDg = 87.0;
        float ph = fract(GameTime);
        float beat = pow(max(0.0, 1.0 - ph * 4.0), 3.0);
        tfxOffg.y -= beat * 0.02;
}
