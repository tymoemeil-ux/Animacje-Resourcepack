vec4 tfxRenderHolo(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    vec2 p = gl_FragCoord.xy;
    float t = GameTime;
    float scan = 0.72 + 0.28 * sin(p.y * 0.9 - t * 4.0);
    float roll = 0.85 + 0.15 * sin(p.y * 0.08 + t * 0.9);
    float n = tfxHashF(vec2(floor(t * 7.0), p.x * 0.01));
    float dropout = (n < 0.18) ? 0.45 : 1.0;
    float v = clamp(scan * roll * dropout, 0.0, 1.0);
    vec3 col = vec3(0.25, 0.95, 1.0) * v + vec3(0.05, 0.25, 0.35) * (1.0 - v);
    return vec4(clamp(col, 0.0, 1.0), a);
}
