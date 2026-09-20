vec4 tfxRenderWielkieKoloNeonAmber(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    float v = 0.5 + 0.5 * step(0.6, sin(t * 4.5));
    vec3 col = vec3(1.0, 0.55, 0.05) * (0.4 + 0.7 * v) + vec3(0.18, 0.08, 0.0);
    return vec4(clamp(col, 0.0, 1.0), a);
}
