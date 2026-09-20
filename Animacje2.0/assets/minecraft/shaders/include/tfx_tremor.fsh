vec4 tfxRenderTremorColor(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float ph = fract(GameTime / 3.0);
    float burst = pow(max(0.0, 1.0 - ph * 3.2), 2.0);
    float f = floor(GameTime * 30.0);
    float n = tfxHashF(vec2(f, 3.0));
    vec3 col = vec3(0.45, 0.22, 0.08) + vec3(0.6, 0.35, 0.1) * burst * n;
    return vec4(col, a);
}
