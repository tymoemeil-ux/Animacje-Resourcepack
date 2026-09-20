vec4 tfxRenderPrad(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float ph = fract(GameTime / 2.0);
    float burst = pow(max(0.0, 1.0 - ph * 3.0), 2.0);
    float n = tfxHashF(vec2(floor(GameTime * 30.0), 0.0));
    vec3 col = vec3(0.3, 0.6, 1.0) * (0.6 + 0.5 * n) + vec3(0.8, 0.9, 1.0) * burst * 0.5;
    return vec4(clamp(col, 0.0, 1.0), a);
}
