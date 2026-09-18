vec4 tfxRenderBungee(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    vec3 col = vec3(1.0, 0.35, 0.08) * (0.7 + 0.3 * sin(t * 3.0)) + vec3(0.16, 0.05, 0.01);
    return vec4(clamp(col, 0.0, 1.0), a);
}
