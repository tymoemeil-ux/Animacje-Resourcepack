if (c == ivec3(160, 160, 200)) {
        tfxIDg = 75.0;
        float f = floor(GameTime * 25.0);
        tfxOffg.x += (tfxHash(vec2(f, 7.0)) - 0.5) * 0.008;
}
