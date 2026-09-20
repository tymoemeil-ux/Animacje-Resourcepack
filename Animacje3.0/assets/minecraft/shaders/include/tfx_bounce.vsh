// Animacje 3.1 — nowy efekt: bounce
if (c == ivec3(255, 93, 162)) {
    tfxIDg = 66.0;
    tfxBaseg = vec4(1.0);
    tfxOffg.y += sin(GameTime * 6.0 + g * 0.55) * 0.010;
}
