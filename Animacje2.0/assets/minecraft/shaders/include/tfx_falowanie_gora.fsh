vec4 tfxRenderFalowanieGora(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    vec3 col = vec3(1.0, 0.5, 0.75) * (0.65 + 0.35 * sin(t * 3.2 + tfxPos.x * 0.05)) + vec3(0.18, 0.06, 0.12);
    return vec4(clamp(col, 0.0, 1.0), a);
}