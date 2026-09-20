// Animacje 3.1 — nowy efekt: comet2
if (c == ivec3(255, 107, 53)) {
    tfxIDg = 70.0;
    tfxBaseg = vec4(1.0);
    tfxOffg.y += sin(GameTime * 7.0 + g * 0.20) * 0.004;
}
