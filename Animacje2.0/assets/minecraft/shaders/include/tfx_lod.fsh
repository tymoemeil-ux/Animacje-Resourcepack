vec4 tfxRenderLod(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    vec2 p = gl_FragCoord.xy;
    float t = GameTime;
    float n = tfxHashF(floor(p * 0.5) + vec2(floor(t * 9.0), 3.0));
    float glint = smoothstep(0.97, 1.0, n) * (0.6 + 0.4 * sin(t * 3.0 + n * 20.0));
    float shimmer = 0.75 + 0.25 * sin(t * 1.5 + p.x * 0.05);
    vec3 col = vec3(0.55, 0.80, 1.0) * shimmer + vec3(0.9, 0.97, 1.0) * glint;
    return vec4(clamp(col, 0.0, 1.0), a);
}