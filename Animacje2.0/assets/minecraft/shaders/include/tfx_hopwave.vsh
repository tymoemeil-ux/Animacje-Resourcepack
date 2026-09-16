if (c == ivec3(0, 255, 144)) {
        tfxIDg = 43.0;
        float ph = fract(g * 0.10 - GameTime * 0.75);
        float b = sin(min(ph / 0.30, 1.0) * 3.14159);
        tfxOffg.y += b * b * 0.028;
}
