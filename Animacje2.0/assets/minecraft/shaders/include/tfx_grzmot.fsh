vec4 tfxRenderGrzmot(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    float s = floor(t * 4.0);
    float on = step(0.45, tfxHashF(vec2(s, 3.7)));
    float crackle = sin(t * 45.0) * 0.5 + 0.5;
    float flash = on * (0.35 + 0.65 * crackle);
    vec3 col = base.rgb * (0.50 + 0.50 * flash) + vec3(0.75, 0.85, 1.0) * flash * 1.5;
    return vec4(clamp(col, 0.0, 1.0), a);
}
