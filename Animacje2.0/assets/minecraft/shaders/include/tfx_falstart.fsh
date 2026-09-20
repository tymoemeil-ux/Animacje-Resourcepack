vec4 tfxRenderFalstart(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    vec3 col = vec3(1.0, 0.5, 0.05) * (0.7 + 0.3 * sin(t * 5.0 + tfxPos.x * 0.05)) + vec3(0.18, 0.08, 0.0);
    return vec4(clamp(col, 0.0, 1.0), a);
}
