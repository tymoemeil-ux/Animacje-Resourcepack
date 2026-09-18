vec4 tfxRenderMgla(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    vec2 p = gl_FragCoord.xy;
    float t = GameTime;
    vec3 c = tfxHsv(0.60, 0.07, 0.62 + 0.16 * sin(t * 0.5 + sin(p.x * 0.003 + t * 0.2) * 1.5));
    return vec4(clamp(c, 0.0, 1.0), a);
}
