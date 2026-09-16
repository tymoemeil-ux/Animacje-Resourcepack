if (c == ivec3(96, 208, 0)) {
        tfxIDg = 186.0;

    float t = GameTime * 1.8;
    float a = exp(-g * 0.18);
    tfxOffg.y += sin(t + g * 0.9) * 0.010 * a;
    tfxOffg.x += cos(t * 1.3 + g * 0.7) * 0.005 * a;
}
