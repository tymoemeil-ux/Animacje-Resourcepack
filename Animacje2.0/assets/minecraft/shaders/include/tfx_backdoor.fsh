vec4 tfxRenderBackdoor(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;

    float t = GameTime;
    float prog = fract(t * 0.35 + tfxPos.x * 0.08);
    float on = step(prog, 0.6);
    float spark = step(0.9, tfxHashF(vec2(floor(t * 15.0), floor(tfxPos.x * 8.0))));
    vec3 col = mix(vec3(0.05, 0.25, 0.1), vec3(0.3, 1.0, 0.5), on) + vec3(spark * 0.4);
    return vec4(col, a);
}
