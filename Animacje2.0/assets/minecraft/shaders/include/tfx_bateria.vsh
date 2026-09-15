// ============================================================
// EFEKT: BATERIA   |   kolor spustowy: #A0A0A8
// zielony puls ladujacej baterii, lekki docisk (HYBRYDA: kolor + ruch)
// ============================================================
if (c == ivec3(160, 160, 168)) {
        tfxIDg = 67.0;
        float ph = fract(GameTime * 0.6);
        tfxOffg.x += sin(ph * 3.14159) * 0.008;
}
