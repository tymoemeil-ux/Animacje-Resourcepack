if (c == ivec3(128, 192, 224)) {
        tfxIDg = 145.0;
        float tri = abs(fract(GameTime * 1.1 + g * 0.05) * 2.0 - 1.0) * 2.0 - 1.0;
        tfxOffg.y += tri * 0.016;
}
