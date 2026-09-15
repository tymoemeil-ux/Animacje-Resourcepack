// ============================================================
// EFEKT: SZNUREK   |   kolor spustowy: #A0A094
// znaki wisza na sznurku i sie balansuja, turkus (HYBRYDA: kolor + ruch)
// ============================================================
if (c == ivec3(160, 160, 148)) {
        tfxIDg = 62.0;
        tfxOffg.x += sin(GameTime * 2.2 + g * 0.25) * 0.014;
        tfxOffg.y += (1.0 - cos(GameTime * 2.2 + g * 0.25)) * 0.004;
}
