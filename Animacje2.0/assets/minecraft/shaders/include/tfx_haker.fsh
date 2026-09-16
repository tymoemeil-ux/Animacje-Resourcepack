vec4 tfxRenderHaker(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;

    float t = GameTime;
    float n = tfxHashF(gl_FragCoord.xy * 0.5 + vec2(floor(t * 12.0), 0.0));
    float flick = 0.55 + 0.45 * step(0.4, n);
    vec3 col = vec3(0.15, 1.0, 0.4) * flick * (0.8 + 0.2 * sin(t * 20.0));
    return vec4(col, a);
}
