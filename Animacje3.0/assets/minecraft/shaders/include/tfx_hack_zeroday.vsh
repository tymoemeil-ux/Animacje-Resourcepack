// Animacje 3.1 — nowy efekt: hack_zeroday
if (c == ivec3(255, 0, 170)) {
    tfxIDg = 80.0;
    tfxBaseg = vec4(1.0);
    tfxOffg.x += (tfxHash(vec2(g, floor(GameTime * 18.0))) - 0.5) * 0.012;
}
