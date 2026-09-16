vec4 tfxRenderAurora(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    vec2 p = gl_FragCoord.xy;
    float t = GameTime;
    float band = sin(p.x * 0.012 + t * 0.8 + sin(p.y * 0.03 - t * 0.5) * 1.5);
    float v = 0.55 + 0.45 * band;
    float h = 0.33 + 0.12 * sin(p.x * 0.008 - t * 0.6);
    vec3 col = tfxHsv(fract(h), 0.8, 0.55 + 0.45 * v);
    col *= 0.85 + 0.15 * sin(p.y * 0.15 + t * 1.2);
    return vec4(clamp(col, 0.0, 1.0), a);
}
