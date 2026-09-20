if (c == ivec3(96, 208, 44)) {
        tfxIDg = 197.0;

    float ph = fract(GameTime * 0.45 + g * 0.045);
    float f = smoothstep(0.05, 0.75, ph);
    tfxOffg.y -= f * f * 0.045;
    tfxOffg.x += (f - 0.5) * 0.006;
}
