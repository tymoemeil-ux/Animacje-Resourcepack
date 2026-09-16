if (c == ivec3(96, 208, 16)) {
        tfxIDg = 190.0;

    float t = GameTime * 2.6;
    float d = mod(g, 2.0) * 2.0 - 1.0;
    tfxOffg.x += sin(t + g * 0.35) * 0.011 * d;
    tfxOffg.y += (1.0 - cos(t + g * 0.35)) * 0.004;
}
