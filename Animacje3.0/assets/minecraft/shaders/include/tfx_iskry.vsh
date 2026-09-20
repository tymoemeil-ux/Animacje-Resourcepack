// Animacje 3.0 — nowy efekt: iskry
if (c == ivec3(176, 192, 2)) {
    tfxIDg = 48.0;
    tfxBaseg = vec4(1.0);
    tfxOffg.y += sin(GameTime * 3.0 + g * 0.7) * 0.004;
}
