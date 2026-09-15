vec4 tfxRenderChroma(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    float v = 0.85 + 0.15 * sin(t * 3.0);
    return vec4(tfxHsv(fract(t * 0.25), 1.0, v), a);
}