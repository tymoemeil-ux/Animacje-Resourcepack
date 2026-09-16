if (c == ivec3(160, 160, 112)) {
        tfxIDg = 53.0;
        float ph = fract(GameTime * 0.5 + g * 0.05);
        tfxOffg.y -= ph * 0.025;
        tfxOffg.x += sin(ph * 6.28 + g) * 0.004;
}
