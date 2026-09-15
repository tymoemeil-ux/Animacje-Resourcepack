vec4 tfxRenderPulseColor(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    float v = 0.65 + 0.35 * sin(t * 5.0);
    vec3 col = vec3(1.0, 0.95, 0.3) * v + vec3(0.25, 0.2, 0.05);
    return vec4(clamp(col, 0.0, 1.0), a);
}