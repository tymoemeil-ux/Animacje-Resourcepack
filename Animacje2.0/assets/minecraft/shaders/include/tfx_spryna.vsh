if (c == ivec3(255, 80, 112)) {
        tfxIDg = 49.0;
        float env = 0.5 + 0.5 * sin(GameTime * 0.9);
        tfxOffg.y += sin(GameTime * 9.0) * 0.011 * (0.3 + 0.7 * env);
        tfxOffg.x += cos(GameTime * 7.0) * 0.006 * env;
}
