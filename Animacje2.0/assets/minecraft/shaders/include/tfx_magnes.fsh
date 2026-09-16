vec4 tfxRenderMagnes(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    float v = 0.6 + 0.4 * sin(t * 6.0);
    vec3 col = vec3(0.2, 0.5, 1.0) * v + vec3(0.05, 0.1, 0.25);
    return vec4(clamp(col, 0.0, 1.0), a);
}
