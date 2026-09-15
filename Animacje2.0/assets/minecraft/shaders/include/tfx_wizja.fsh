vec4 tfxRenderWizja(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    float scan = 0.7 + 0.3 * sin(gl_FragCoord.y * 1.1 - t * 15.0);
    float n = tfxHashF(vec2(floor(t * 25.0), 0.0));
    float v = clamp(scan * (0.6 + 0.4 * n), 0.0, 1.0);
    vec3 col = vec3(0.7, 0.8, 1.0) * v;
    return vec4(col, a);
}