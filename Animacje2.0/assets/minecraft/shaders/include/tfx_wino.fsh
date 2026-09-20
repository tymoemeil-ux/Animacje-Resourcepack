vec4 tfxRenderWino(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    vec2 p = gl_FragCoord.xy;
    float t = GameTime;
    vec3 c = tfxHsv(0.88, 0.52, 0.42 + 0.13 * sin(t * 0.8 + p.x * 0.008));
    return vec4(clamp(c, 0.0, 1.0), a);
}
