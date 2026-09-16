if (c == ivec3(96, 208, 20)) {
        tfxIDg = 191.0;

    float ph = fract(GameTime * 1.6 + g * 0.13);
    float b = sin(min(ph / 0.45, 1.0) * 3.14159);
    tfxOffg.y -= b * b * 0.026;
    tfxOffg.x += (b - 0.5) * 0.004;
}
