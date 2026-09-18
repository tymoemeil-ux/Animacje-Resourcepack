vec4 tfxRenderChmura(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    vec2 p = gl_FragCoord.xy;
    float t = GameTime;
    vec3 c = tfxHsv(0.60, 0.05, 0.86 + 0.06 * sin(p.x * 0.010 + t * 0.35 + sin(p.y * 0.020 - t * 0.2)));
    return vec4(clamp(c, 0.0, 1.0), a);
}
