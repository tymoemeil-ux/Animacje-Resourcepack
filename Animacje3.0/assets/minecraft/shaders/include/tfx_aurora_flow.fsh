vec4 tfxRenderAuroraFlow(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    float h = fract(0.40 + sin(t * 0.7 + tfxPos.x * 0.018) * 0.16);
    return vec4(tfxHsv(h, 0.72, 0.96), a);
}
