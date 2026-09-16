if (c == ivec3(255, 128, 192)) {
        tfxIDg = 45.0;
        float ph = g * 0.60 + GameTime * 5.0;
        tfxOffg.x += cos(ph) * 0.014;
        tfxOffg.y += sin(ph) * 0.014;
}
