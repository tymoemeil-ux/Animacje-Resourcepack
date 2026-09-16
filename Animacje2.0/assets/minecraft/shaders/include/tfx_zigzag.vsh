if (c == ivec3(176, 176, 0)) {
        tfxIDg = 48.0;
        float q = GameTime * 1.4 + g * 0.04;
        float p = fract(q);
        float e = smoothstep(0.0, 0.18, min(p, 1.0 - p));
        float sgn = (mod(floor(q), 2.0) == 0.0) ? 1.0 : -1.0;
        tfxOffg.x += sgn * e * 0.022;
}
