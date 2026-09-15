// ============================================================
// EFEKT: LUNA   |   kolor spustowy: #A0A0A4
// wolny dryf jak w ksiezycnym swietle, srebrno-niebieski (HYBRYDA: kolor + ruch)
// ============================================================
if (c == ivec3(160, 160, 164)) {
        tfxIDg = 66.0;
        tfxOffg.y += sin(GameTime * 1.1) * 0.008;
        tfxOffg.x += sin(GameTime * 0.7) * 0.005;
}
