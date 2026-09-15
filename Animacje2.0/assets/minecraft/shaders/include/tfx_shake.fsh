vec4 tfxRenderShakeColor(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float f = floor(GameTime * 30.0);
    float n = tfxHashF(vec2(f, 1.0));
    vec3 col = vec3(0.95, 0.55, 0.15) * (0.7 + 0.35 * n);
    return vec4(col, a);
}