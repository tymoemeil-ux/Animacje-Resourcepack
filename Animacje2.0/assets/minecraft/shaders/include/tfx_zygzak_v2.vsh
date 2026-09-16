if (c == ivec3(160, 160, 240)) {
        tfxIDg = 85.0;
        float tri = abs(fract(GameTime * 1.1 + g * 0.05) * 2.0 - 1.0) * 2.0 - 1.0;
        tfxOffg.y += tri * 0.016;
}
