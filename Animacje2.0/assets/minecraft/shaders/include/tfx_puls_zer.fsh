vec4 tfxRenderPulsZer(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    vec3 col = vec3(0.85, 0.05, 0.2) * (0.6 + 0.4 * sin(t * 5.0)) + vec3(0.12, 0.01, 0.03);
    return vec4(clamp(col, 0.0, 1.0), a);
}
