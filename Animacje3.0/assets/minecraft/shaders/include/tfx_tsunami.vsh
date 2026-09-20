if (c == ivec3(64, 128, 255)) {
        tfxIDg = 23.0;
        {
            float t = GameTime * 2.0;
            tfxOffg.y += sin(t + g * 0.30) * 0.045 + sin(t * 0.37 + g * 0.11) * 0.020;
            tfxOffg.x += cos(t * 0.8 + g * 0.20) * 0.006;
        }
}
