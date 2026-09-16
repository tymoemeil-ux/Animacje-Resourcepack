vec4 tfxRenderBateria(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    vec3 col = vec3(0.15, 0.8, 0.3) * (0.5 + 0.5 * sin(t * 3.7)) + vec3(0.05, 0.15, 0.05);
    return vec4(clamp(col, 0.0, 1.0), a);
}
