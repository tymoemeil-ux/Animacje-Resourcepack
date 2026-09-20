// Animacje 3.1 — nowy efekt: hack_glitch
if (c == ivec3(182, 255, 0)) {
    tfxIDg = 83.0;
    tfxBaseg = vec4(1.0);
    tfxOffg.x += (tfxHash(vec2(g, floor(GameTime * 24.0))) - 0.5) * 0.016;
}
