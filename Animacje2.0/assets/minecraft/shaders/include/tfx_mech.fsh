vec4 tfxRenderMech(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    vec2 p = gl_FragCoord.xy;
    float t = GameTime;
    vec3 c = tfxHsv(0.36, 0.28, 0.46 + 0.11 * sin(p.x * 0.014 - t * 0.6 + sin(p.y * 0.020 + t * 0.35)));
    return vec4(clamp(c, 0.0, 1.0), a);
}
