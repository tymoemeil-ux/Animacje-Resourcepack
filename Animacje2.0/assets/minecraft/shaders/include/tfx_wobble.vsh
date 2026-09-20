if (c == ivec3(224, 192, 64)) {
        tfxIDg = 44.0;
        float f = floor(GameTime * 22.0);
        tfxOffg.x += (tfxHash(vec2(f, 1.0)) - 0.5) * 0.007;
        tfxOffg.y += (tfxHash(vec2(f, 2.0)) - 0.5) * 0.007;
}
