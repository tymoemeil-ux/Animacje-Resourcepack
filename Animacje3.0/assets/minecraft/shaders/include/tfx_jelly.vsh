// Animacje 3.1 — nowy efekt: jelly
if (c == ivec3(122, 240, 209)) {
    tfxIDg = 68.0;
    tfxBaseg = vec4(1.0);
    tfxOffg.y += sin(GameTime * 5.0 + g * 0.75) * 0.006;
}
