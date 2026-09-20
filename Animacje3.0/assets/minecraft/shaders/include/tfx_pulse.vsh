if (c == ivec3(255, 255, 48)) {
        tfxIDg = 26.0;
        tfxOffg.y += sin(GameTime * 6.0) * 0.015 * (mod(g, 2.0) < 1.0 ? 1.0 : -1.0);
}
