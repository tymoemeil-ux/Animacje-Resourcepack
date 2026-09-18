if (c == ivec3(255, 112, 0)) {
        tfxIDg = 41.0;
        float ph = fract(GameTime * 0.85);
        float b = sin(min(ph / 0.42, 1.0) * 3.14159);
        tfxOffg.y += b * b * 0.035;
}
