if (c == ivec3(144, 255, 48)) {
        tfxIDg = 20.0;
        {
            float a = GameTime * 6.0 + g * 1.35;
            float r = 0.008 + 0.010 * (0.5 + 0.5 * sin(g * 0.9));
            tfxOffg.x += sin(a) * r * 1.4;
            tfxOffg.y += cos(a) * r;
        }
}
