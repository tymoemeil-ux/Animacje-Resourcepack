vec4 tfxRenderPustynia(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    vec2 p = gl_FragCoord.xy;
    float t = GameTime;
    vec3 c = tfxHsv(0.12, 0.34, 0.66 + 0.11 * sin(p.x * 0.020 + t * 0.9 + sin(p.y * 0.050 - t * 0.55) * 1.4));
    return vec4(clamp(c, 0.0, 1.0), a);
}
