if (c == ivec3(128, 192, 16)) {
        tfxIDg = 93.0;
        float f = floor(GameTime * 28.0);
        tfxOffg.y += (tfxHash(vec2(f, g)) - 0.5) * 0.010;
}
