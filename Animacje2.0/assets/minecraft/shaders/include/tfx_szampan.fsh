vec4 tfxRenderSzampan(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;

    float t = GameTime;
    float n = tfxHashF(gl_FragCoord.xy * 0.4 + vec2(0.0, floor(t * 8.0)));
    float bub = pow(n, 8.0) * (0.6 + 0.4 * sin(t * 7.0 + n * 25.0));
    vec3 col = vec3(0.95, 0.8, 0.45) + vec3(1.0, 0.95, 0.7) * bub;
    return vec4(col, a);
}
