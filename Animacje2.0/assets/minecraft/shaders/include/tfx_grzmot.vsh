if (c == ivec3(160, 160, 20)) {
        tfxIDg = 6.0;
        tfxBaseg = vec4(0.36, 0.40, 0.52, 1.0);
        tfxOffg.x += (tfxHash(vec2(floor(GameTime * 20.0), 1.0)) - 0.5) * 0.006;
        tfxOffg.y += (tfxHash(vec2(floor(GameTime * 20.0), 2.0)) - 0.5) * 0.006;
}
