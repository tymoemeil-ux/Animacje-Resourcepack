// ============================================================
// EFEKT (HYBRYDA: kolor + ruch): DIAMENT   |   kolor spustowy: #A0A040
// diament — jasny blask przetacza sie skosno, ogon zanika
// ============================================================
if (c == ivec3(160, 160, 64)) {
        tfxIDg = 29.0;
        tfxBaseg = vec4(1.0);
        tfxOffg.y += sin(GameTime * 4.0 + g * 0.4) * 0.005;
}
