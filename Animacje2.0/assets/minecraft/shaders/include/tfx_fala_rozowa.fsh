vec4 tfxRenderFalaRozowa(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    vec3 col = vec3(1.0, 0.35, 0.7) * (0.65 + 0.35 * sin(t * 3.2 + tfxPos.x * 0.06)) + vec3(0.2, 0.05, 0.15);
    return vec4(clamp(col, 0.0, 1.0), a);
}
