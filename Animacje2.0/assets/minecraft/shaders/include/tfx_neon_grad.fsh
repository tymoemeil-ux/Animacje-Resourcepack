vec4 tfxRenderNeonGrad(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    vec2 p = gl_FragCoord.xy;
    float t = GameTime;
    float h = fract(t * 0.12 + sin(p.x * 0.008 + t * 1.4) * 0.10 + p.y * 0.001);
    float v = 0.8 + 0.2 * sin(t * 2.5 + p.x * 0.02);
    return vec4(tfxHsv(h, 0.95, v), a);
}
