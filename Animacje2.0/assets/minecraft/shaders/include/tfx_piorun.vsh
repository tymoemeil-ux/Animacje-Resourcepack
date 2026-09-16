if (c == ivec3(160, 160, 48)) {
        tfxIDg = 13.0;
        tfxBaseg = vec4(0.40, 0.45, 0.55, 1.0);
        tfxOffg.x += (tfxHash(vec2(floor(GameTime * 24.0), 1.0)) - 0.5) * 0.010;
}
