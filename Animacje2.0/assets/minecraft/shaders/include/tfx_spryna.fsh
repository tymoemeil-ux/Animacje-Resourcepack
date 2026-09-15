vec4 tfxRenderSprynaColor(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float v = 0.55 + 0.45 * (0.5 + 0.5 * sin(GameTime * 9.0));
    vec3 col = vec3(0.95, 0.25, 0.4) * v + vec3(0.2, 0.05, 0.12);
    return vec4(clamp(col, 0.0, 1.0), a);
}