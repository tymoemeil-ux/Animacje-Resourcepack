if (c == ivec3(160, 160, 228)) {
        tfxIDg = 82.0;
        float ph = fract(GameTime * 0.5);
        tfxOffg.y += ph * 0.03;
        tfxOffg.x += sin(ph * 6.28 + g) * 0.003;
}
