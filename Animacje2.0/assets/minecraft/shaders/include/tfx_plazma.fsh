vec4 tfxRenderPlazma(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    vec2 p = gl_FragCoord.xy * 0.012;
    float t = GameTime;
    float v = sin(p.x * 3.0 + t * 1.7)
            + sin(p.y * 2.6 - t * 1.3)
            + sin((p.x + p.y) * 2.0 + t * 2.1);
    v = v * 0.1667 + 0.5;
    float h = fract(v + t * 0.05);
    return vec4(tfxHsv(h, 0.85, 0.95), a);
}
