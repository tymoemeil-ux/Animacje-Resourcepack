vec4 tfxRenderWznoszenieSzafir(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    float n = tfxHashF(gl_FragCoord.xy * 0.35 + vec2(floor(t * 5.0), 0.0));
    float glint = pow(n, 3.0) * (0.5 + 0.5 * sin(t * 4.0 + n * 25.0));
    vec3 col = vec3(0.1, 0.2, 0.9) * (0.7 + 0.3 * sin(t * 2.2 + tfxPos.x * 0.05)) + vec3(0.5, 0.7, 1.0) * glint;
    return vec4(clamp(col, 0.0, 1.0), a);
}
