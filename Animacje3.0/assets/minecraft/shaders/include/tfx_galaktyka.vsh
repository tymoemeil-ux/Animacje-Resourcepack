if (c == ivec3(160, 160, 40)) {
        tfxIDg = 10.0;
        tfxBaseg = vec4(1.0);
        tfxOffg.x += cos(GameTime * 1.5 + g * 0.4) * 0.006;
        tfxOffg.y += sin(GameTime * 1.5 + g * 0.4) * 0.006;
}
