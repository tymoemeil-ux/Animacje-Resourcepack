if (c == ivec3(160, 160, 84)) {
        tfxIDg = 34.0;
        tfxBaseg = vec4(1.0);
        tfxOffg.y += pow(max(0.0, sin(fract(GameTime * 0.7) * 9.42)), 6.0) * 0.008;
}
