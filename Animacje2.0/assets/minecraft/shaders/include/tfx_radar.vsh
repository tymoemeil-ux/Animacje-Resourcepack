// ============================================================
// EFEKT (HYBRYDA: kolor + ruch): RADAR   |   kolor spustowy: #A0A058
// cyjanowa linia skanu skosno, z zanikajacym ogonem
// ============================================================
if (c == ivec3(160, 160, 88)) {
        tfxIDg = 35.0;
        tfxBaseg = vec4(1.0);
        tfxOffg.x += sin(GameTime * 4.4) * 0.005;
}
