if (c == ivec3(96, 176, 52)) {
        tfxIDg = 169.0;

    float t = GameTime * 1.5;
    tfxOffg.y += (sin(t * 2.1 - g * 0.9) + sin(t * 3.3 + g * 1.7) * 0.5) * 0.006;
    tfxOffg.x += sin(t * 1.4 + g * 2.3) * 0.004;
}
