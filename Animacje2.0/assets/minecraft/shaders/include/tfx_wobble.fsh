vec4 tfxRenderWobbleColor(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float f = floor(GameTime * 22.0);
    float n = tfxHashF(vec2(f, 2.0));
    vec3 col = vec3(0.85, 0.7, 0.2) * (0.75 + 0.3 * n);
    return vec4(col, a);
}
