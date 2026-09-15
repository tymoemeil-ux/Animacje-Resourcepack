
vec4 tfxRenderPiorun(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    float s = floor(t * 20.0);
    float r = tfxHashF(vec2(s, 9.1));
    float flick = r < 0.35 ? (0.5 + 0.5 * r * 2.0) : 0.12;
    float big = step(0.93, tfxHashF(vec2(floor(t * 2.0), 4.4)));
    float flash = flick + big * 1.2;
    vec3 col = base.rgb * (0.35 + 0.40 * flick) + vec3(0.80, 0.87, 1.0) * flash * 1.6;
    return vec4(clamp(col, 0.0, 1.0), a);
}
