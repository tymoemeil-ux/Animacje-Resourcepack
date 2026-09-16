vec4 tfxRenderZigzagColor(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float v = 0.65 + 0.35 * abs(sin(GameTime * 2.7));
    vec3 col = vec3(0.7, 0.7, 0.12) * v + vec3(0.15, 0.15, 0.02);
    return vec4(clamp(col, 0.0, 1.0), a);
}
