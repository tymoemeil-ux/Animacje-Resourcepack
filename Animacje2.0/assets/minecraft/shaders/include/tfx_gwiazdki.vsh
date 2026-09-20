if (c == ivec3(160, 160, 180)) {
        tfxIDg = 70.0;
        float ph = g * 0.8 + GameTime * 2.0;
        tfxOffg.x += cos(ph) * 0.005;
        tfxOffg.y += sin(ph) * 0.005;
}
