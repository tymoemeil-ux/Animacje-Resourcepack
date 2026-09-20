vec4 tfxRenderGwiazdyZloto(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    vec2 p = gl_FragCoord.xy;
    float t = GameTime;
    float h = tfxHashF(vec2(floor(p.x / 3.0), floor(p.y / 3.0) + floor(t * 2.5)));
    float b = smoothstep(0.88, 1.0, h);
    return vec4(base.rgb * (0.45 + 1.5 * b), a);
}
