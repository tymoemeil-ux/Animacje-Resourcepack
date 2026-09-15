vec4 tfxRenderFlickerColor(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float f = floor(GameTime * 15.0);
    float n = tfxHashF(vec2(f, 0.0));
    float v = 0.35 + 0.65 * n;
    vec3 col = vec3(0.85, 0.9, 1.0) * v;
    return vec4(col, a);
}