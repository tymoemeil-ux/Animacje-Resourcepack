if (c == ivec3(128, 192, 148)) {
        tfxIDg = 126.0;
        float e = smoothstep(0.0, 0.5, 0.5 + 0.5 * sin(GameTime * 2.2));
        tfxOffg.x += (e * 2.0 - 1.0) * 0.018;
}
