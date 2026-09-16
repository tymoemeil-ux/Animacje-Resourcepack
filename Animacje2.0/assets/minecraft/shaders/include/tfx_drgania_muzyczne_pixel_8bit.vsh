if (c == ivec3(128, 192, 152)) {
        tfxIDg = 127.0;
        float ph = fract(GameTime);
        float beat = pow(max(0.0, 1.0 - ph * 4.0), 3.0);
        tfxOffg.y -= beat * 0.02;
}
