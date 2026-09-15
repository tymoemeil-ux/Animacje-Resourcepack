// ============================================================
// EFEKT: RIPPLE   |   kolor spustowy: #00E0C0
// podwójna fala — dwie nachodzone faly zywnosci
// ============================================================
if (c == ivec3(0, 224, 192)) {
        tfxIDg = 39.0;
        tfxOffg.y += sin(g * 0.80 - GameTime * 7.0) * 0.012;
        tfxOffg.y += sin(g * 0.35 - GameTime * 3.4 + 1.7) * 0.009;
}
