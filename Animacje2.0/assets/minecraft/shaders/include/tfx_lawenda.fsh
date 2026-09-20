vec4 tfxRenderLawenda(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    vec2 p = gl_FragCoord.xy;
    float t = GameTime;
    vec3 c = tfxHsv(0.75, 0.24, 0.66 + 0.11 * sin(t * 0.7 + p.x * 0.010));
    return vec4(clamp(c, 0.0, 1.0), a);
}
