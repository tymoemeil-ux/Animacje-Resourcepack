vec4 tfxRenderTrzesieniePionowe(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float f = floor(GameTime * 28.0);
    float n = tfxHashF(vec2(f, 1.0));
    vec3 col = vec3(0.95, 0.15, 0.1) * (0.75 + 0.25 * n) + vec3(0.12, 0.01, 0.01);
    return vec4(clamp(col, 0.0, 1.0), a);
}
