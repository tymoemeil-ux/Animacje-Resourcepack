if (c == ivec3(160, 64, 0)) {
        tfxIDg = 46.0;
        float ph = fract(GameTime / 3.0);
        float burst = pow(max(0.0, 1.0 - ph * 3.2), 2.0);
        float f = floor(GameTime * 30.0);
        tfxOffg.x += (tfxHash(vec2(f, 3.0)) - 0.5) * 0.022 * burst;
        tfxOffg.y += (tfxHash(vec2(f, 4.0)) - 0.5) * 0.022 * burst;
}
