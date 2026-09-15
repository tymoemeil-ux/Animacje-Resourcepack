// ============================================================
// EFEKT (RUCH): DESZCZ_ZIEMI   |   kolor spustowy: #A0A0E0
// tekst powoli tonie w ziemi, brazowa ziemia
// ============================================================
if (c == ivec3(160, 160, 224)) {
        tfxIDg = 81.0;
        float ph = fract(GameTime * 0.4);
        tfxOffg.y -= ph * 0.035;
}
