// Animacje 3.0 — nowy efekt: szkło
if (c == ivec3(176, 192, 4)) {
    tfxIDg = 50.0;
    tfxBaseg = vec4(1.0);
    tfxOffg.y += sin(GameTime * 1.5 + g * 0.3) * 0.003;
}
