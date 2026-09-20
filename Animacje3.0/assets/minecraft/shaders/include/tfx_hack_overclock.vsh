// Animacje 3.1 — nowy efekt: hack_overclock
if (c == ivec3(255, 109, 0)) {
    tfxIDg = 85.0;
    tfxBaseg = vec4(1.0);
    tfxOffg.y += sin(GameTime * 11.0 + g * 0.50) * 0.004;
}
