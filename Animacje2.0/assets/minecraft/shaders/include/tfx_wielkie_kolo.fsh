vec4 tfxRenderWielkieKolo(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    vec3 col = vec3(0.3, 0.25, 1.0) * (0.65 + 0.35 * sin(t * 1.6 + tfxPos.x * 0.05)) + vec3(0.06, 0.05, 0.2);
    return vec4(clamp(col, 0.0, 1.0), a);
}
