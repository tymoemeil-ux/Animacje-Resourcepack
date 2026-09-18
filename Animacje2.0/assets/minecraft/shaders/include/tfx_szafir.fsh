vec4 tfxRenderSzafir(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    vec2 p = gl_FragCoord.xy;
    float t = GameTime;
    vec3 c = tfxHsv(0.62, 0.72, 0.50); c *= 0.78 + 0.34 * sin(p.x * 0.020 - t * 1.3 + sin(p.y * 0.010 + t * 0.4));
    return vec4(clamp(c, 0.0, 1.0), a);
}
