vec4 tfxRenderWoda(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    vec2 p = gl_FragCoord.xy;
    float t = GameTime;
    vec3 c = tfxHsv(0.55, 0.50, 0.48 + 0.16 * sin(p.x * 0.028 - t * 1.5 + sin(p.x * 0.011 + t * 0.8) * 1.8));
    return vec4(clamp(c, 0.0, 1.0), a);
}
