vec4 tfxRenderUnoszenieFale(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    vec3 col = vec3(0.1, 0.85, 1.0) * (0.65 + 0.35 * sin(t * 4.4 + tfxPos.x * 0.06)) + vec3(0.02, 0.14, 0.18);
    return vec4(clamp(col, 0.0, 1.0), a);
}