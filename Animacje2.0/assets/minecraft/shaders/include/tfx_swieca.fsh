vec4 tfxRenderSwieca(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    vec2 p = gl_FragCoord.xy;
    float t = GameTime;
    vec3 c = tfxHsv(0.10, 0.50, 0.66 + 0.09 * sin(t * 5.0) + 0.05 * sin(t * 17.0 + p.x * 0.05));
    return vec4(clamp(c, 0.0, 1.0), a);
}
