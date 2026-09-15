vec4 tfxRenderGwiazdki(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    float n = tfxHashF(gl_FragCoord.xy * 0.3);
    float tw = pow(n, 3.0) * (0.5 + 0.5 * sin(t * 4.0 + n * 40.0));
    vec3 col = vec3(0.8, 0.85, 1.0) * (0.6 + 0.4 * tw);
    return vec4(clamp(col, 0.0, 1.0), a);
}