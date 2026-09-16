if (c == ivec3(96, 176, 56)) {
        tfxIDg = 170.0;

    float t = GameTime * 1.4;
    float w = sin(t + g * 0.5);
    tfxOffg.x += w * 0.014;
    tfxOffg.y -= abs(w) * 0.018;
}
