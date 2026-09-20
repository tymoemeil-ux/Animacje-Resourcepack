if (c == ivec3(128, 192, 140)) {
        tfxIDg = 124.0;
        float t = GameTime;
        tfxOffg.y += sin(tfxPos.x * 0.08 - t * 3.0) * cos(t * 1.3) * 0.012;
}
