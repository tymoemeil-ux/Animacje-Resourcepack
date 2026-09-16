if (c == ivec3(160, 160, 144)) {
        tfxIDg = 61.0;
        float ph = fract(GameTime * 1.2);
        float pull = ph < 0.75 ? smoothstep(0.0, 0.75, ph) : (1.0 - smoothstep(0.75, 1.0, ph));
        tfxOffg.x -= pull * 0.035;
}
