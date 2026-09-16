vec4 tfxRenderFalaZielona(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    vec3 col = vec3(0.1, 1.0, 0.4) * (0.65 + 0.35 * sin(t * 4.0 + tfxPos.x * 0.06)) + vec3(0.0, 0.15, 0.05);
    return vec4(clamp(col, 0.0, 1.0), a);
}
