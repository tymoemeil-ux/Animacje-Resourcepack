vec4 tfxRenderSzmaragd(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    vec2 p = gl_FragCoord.xy;
    float t = GameTime;
    vec3 c = tfxHsv(0.45, 0.60, 0.48 + 0.18 * sin(t * 1.4 + p.x * 0.008));
    return vec4(clamp(c, 0.0, 1.0), a);
}
