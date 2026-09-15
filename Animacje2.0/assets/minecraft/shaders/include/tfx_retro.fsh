vec4 tfxRenderRetro(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    float n = tfxHashF(gl_FragCoord.xy * 0.5 + vec2(floor(t * 10.0), 0.0));
    float split = sin(gl_FragCoord.y * 0.6 - t * 8.0) * 0.1;
    vec3 col = vec3(1.0, 0.2, 0.7) * (0.6 + 0.4 * n);
    col += vec3(0.1, 0.8, 1.0) * max(0.0, split);
    col += vec3(0.3, 0.1, 0.35);
    return vec4(clamp(col, 0.0, 1.0), a);
}