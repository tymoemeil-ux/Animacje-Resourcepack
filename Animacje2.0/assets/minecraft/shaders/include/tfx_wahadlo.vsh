if (c == ivec3(96, 176, 48)) {
        tfxIDg = 168.0;

    float t = GameTime * 1.6;
    float sw = sin(t - g * 0.4);
    tfxOffg.x += sw * 0.016;
    tfxOffg.y += (1.0 - cos(t - g * 0.4)) * 0.005;
}
