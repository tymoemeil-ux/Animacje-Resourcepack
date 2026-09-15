vec4 tfxRenderSzarpColor(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float v = 0.6 + 0.4 * abs(cos(GameTime * 2.6));
    vec3 col = vec3(0.0, 0.75, 0.75) * v + vec3(0.02, 0.12, 0.12);
    return vec4(clamp(col, 0.0, 1.0), a);
}