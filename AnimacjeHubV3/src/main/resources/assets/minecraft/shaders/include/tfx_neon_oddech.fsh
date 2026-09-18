vec4 tfxRenderNeonOdech(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    float h = 0.85 + 0.12 * sin(t * 3.0);
    float v = 0.6 + 0.4 * (0.5 + 0.5 * sin(t * 3.0));
    return vec4(tfxHsv(fract(h), 0.9, v), a);
}
