if (c == ivec3(96, 208, 36)) {
        tfxIDg = 195.0;

    float t = GameTime * 1.3;
    float f = fract(t * 0.35 + g * 0.21);
    tfxOffg.y -= f * 0.030;
    tfxOffg.x += sin(g * 4.7 + t * 2.0) * 0.003;
}
