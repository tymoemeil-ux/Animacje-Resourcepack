if (c == ivec3(255, 160, 48)) {
        tfxIDg = 25.0;
        {
            float step = floor(GameTime * 28.0);
            tfxOffg.x += (tfxHash(vec2(g * 3.3, step)) - 0.5) * 0.011;
            tfxOffg.y += (tfxHash(vec2(g * 5.1, step + 11.0)) - 0.5) * 0.011;
        }
}
