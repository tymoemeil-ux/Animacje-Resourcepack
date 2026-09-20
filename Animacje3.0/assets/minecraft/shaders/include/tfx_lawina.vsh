if (c == ivec3(160, 160, 108)) {
        tfxIDg = 35.0;
        float ph = fract(GameTime * 0.8 + g * 0.08);
        tfxOffg.y -= min(ph * 1.6, 1.0) * 0.03;
}
