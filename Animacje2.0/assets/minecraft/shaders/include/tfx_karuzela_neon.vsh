if (c == ivec3(160, 160, 124)) {
        tfxIDg = 56.0;
        float ph = g * 0.6 + GameTime * 4.0;
        tfxOffg.x += cos(ph) * 0.012;
        tfxOffg.y += sin(ph) * 0.012;
}
