if (c == ivec3(160, 160, 208)) {
        tfxIDg = 77.0;
        float ph = GameTime * 2.0 + g * 0.3;
        float r = 0.006 + 0.005 * (0.5 + 0.5 * sin(GameTime * 0.7));
        tfxOffg.x += cos(ph) * r;
        tfxOffg.y += sin(ph) * r * 0.7;
}
