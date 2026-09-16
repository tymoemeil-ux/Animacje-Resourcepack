if (c == ivec3(128, 192, 188)) {
        tfxIDg = 136.0;
        float ph = GameTime * 3.0 + g * 0.35;
        tfxOffg.x += cos(ph) * 0.010;
        tfxOffg.y += sin(ph * 2.0) * 0.007;
}
