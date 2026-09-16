if (c == ivec3(18, 0, 128)) {
        tfxIDg = 248.0;
        tfxBaseg = vec4(0.90, 0.95, 0.60, 1.0);
        tfxOffg.xy += (vec2(tfxHash(vec2(g, floor(GameTime * 14.0))), tfxHash(vec2(floor(GameTime * 14.0), g * 3.1))) - 0.5) * 2.2;

}
