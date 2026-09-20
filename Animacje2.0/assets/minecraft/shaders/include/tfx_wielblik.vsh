if (c == ivec3(96, 176, 32)) {
        tfxIDg = 164.0;

    float t = GameTime * 0.7;
    tfxOffg.y += sin(t * 2.0 - g * 0.25) * 0.020;
    tfxOffg.x += cos(t - g * 0.18) * 0.008;
}
