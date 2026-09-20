if (c == ivec3(240, 240, 240)) {
        tfxIDg = 24.0;
        float n = tfxHash(vec2(g, floor(GameTime * 14.0)));
        if (n < 0.28) {
            tfxAlphag = 0.0;
        }
        tfxOffg.y += (n - 0.5) * 0.008;
}
