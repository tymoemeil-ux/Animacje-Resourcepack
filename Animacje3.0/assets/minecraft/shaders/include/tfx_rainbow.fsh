vec4 tfxRenderRainbowColor(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    float h = fract(tfxPos.x * 0.05 - t * 0.5);
    float v = 0.85 + 0.15 * sin(t * 6.0 + tfxPos.x * 0.1);
    return vec4(tfxHsv(h, 1.0, v), a);
}
