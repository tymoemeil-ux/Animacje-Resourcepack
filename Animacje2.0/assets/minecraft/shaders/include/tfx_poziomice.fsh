vec4 tfxRenderPoziomice(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    vec2 p = gl_FragCoord.xy;
    float t = GameTime;
    vec3 c = tfxHsv(0.08, 0.32, 0.60 + 0.13 * sin(p.y * 0.070 + t * 0.7));
    return vec4(clamp(c, 0.0, 1.0), a);
}
