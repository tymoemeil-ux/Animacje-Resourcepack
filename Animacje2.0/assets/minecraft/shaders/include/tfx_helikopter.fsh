vec4 tfxRenderHelikopter(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    float v = 0.6 + 0.4 * sin(t * 6.0);
    vec3 col = vec3(1.0, 0.15, 0.1) * v + vec3(0.25, 0.03, 0.02);
    return vec4(clamp(col, 0.0, 1.0), a);
}
