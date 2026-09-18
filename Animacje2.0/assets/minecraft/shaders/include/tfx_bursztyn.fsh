vec4 tfxRenderBursztyn(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    vec2 p = gl_FragCoord.xy;
    float t = GameTime;
    vec3 c = tfxHsv(0.105, 0.55, 0.58 + 0.18 * sin(t * 1.1 + p.y * 0.008));
    return vec4(clamp(c, 0.0, 1.0), a);
}
