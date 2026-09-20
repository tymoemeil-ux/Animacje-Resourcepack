if (c == ivec3(128, 192, 212)) {
        tfxIDg = 142.0;
        float ph = fract(GameTime * 0.5);
        tfxOffg.y += ph * 0.03;
        tfxOffg.x += sin(ph * 6.28 + g) * 0.003;
}
