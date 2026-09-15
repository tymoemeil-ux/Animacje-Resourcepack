// ============================================================
// EFEKT (RUCH): WIBROWANIE   |   kolor spustowy: #A0A0D4
// wyska czestotliwosc w poprzek, fiolet
// ============================================================
if (c == ivec3(160, 160, 212)) {
        tfxIDg = 78.0;
        tfxOffg.x += sin(GameTime * 18.0 + g * 0.2) * 0.005;
}
