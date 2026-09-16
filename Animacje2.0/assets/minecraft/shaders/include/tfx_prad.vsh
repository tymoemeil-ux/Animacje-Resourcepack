if (c == ivec3(160, 160, 160)) {
        tfxIDg = 65.0;
        float ph = fract(GameTime / 2.0);
        float burst = pow(max(0.0, 1.0 - ph * 3.0), 2.0);
        float f = floor(GameTime * 30.0);
        tfxOffg.x += (tfxHash(vec2(f, 1.0)) - 0.5) * 0.018 * burst;
        tfxOffg.y += (tfxHash(vec2(f, 2.0)) - 0.5) * 0.014 * burst;
}
