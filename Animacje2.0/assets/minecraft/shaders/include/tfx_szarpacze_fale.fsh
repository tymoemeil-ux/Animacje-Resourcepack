vec4 tfxRenderSzarpaczeFale(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    vec3 col = vec3(1.0, 0.95, 0.1) * (0.7 + 0.3 * sin(t * 6.0)) + vec3(0.2, 0.18, 0.02);
    return vec4(clamp(col, 0.0, 1.0), a);
}