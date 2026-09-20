if (c == ivec3(192, 64, 255)) {
        tfxIDg = 40.0;
        float ph = g * 0.55 + GameTime * 2.6;
        tfxOffg.x += cos(ph) * 0.010;
        tfxOffg.y += sin(ph) * 0.020;
}
