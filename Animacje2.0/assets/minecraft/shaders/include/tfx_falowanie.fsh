vec4 tfxRenderFalowanie(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    vec2 p = gl_FragCoord.xy;
    float t = GameTime;
    vec3 c = tfxHsv(0.50, 0.38, 0.58 + 0.18 * sin(p.x * 0.018 - t * 1.1));
    return vec4(clamp(c, 0.0, 1.0), a);
}
