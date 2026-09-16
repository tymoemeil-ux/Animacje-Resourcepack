if (c == ivec3(128, 192, 240)) {
        tfxIDg = 149.0;
        float ph = GameTime * 0.8 + g * 0.2;
        tfxOffg.x += cos(ph) * 0.02;
        tfxOffg.y += sin(ph) * 0.02;
}
