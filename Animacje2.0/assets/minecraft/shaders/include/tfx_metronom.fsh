vec4 tfxRenderMetronom(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    vec3 col = vec3(0.8, 0.83, 0.88) * (0.7 + 0.3 * sin(t * 4.4)) + vec3(0.15, 0.15, 0.17);
    return vec4(clamp(col, 0.0, 1.0), a);
}