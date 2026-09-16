if (c == ivec3(96, 208, 28)) {
        tfxIDg = 193.0;

    float t = GameTime * 7.0;
    tfxOffg.x += (tfxHash(vec2(floor(t), g)) - 0.5) * 0.006;
    tfxOffg.y += sin(t * 1.7 + g * 3.1) * 0.004;
}
