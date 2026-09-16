vec4 tfxRenderFalaOdSrodka(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    vec3 col = vec3(0.4, 0.3, 1.0) * (0.6 + 0.4 * sin(t * 4.0 + tfxPos.x * 0.05)) + vec3(0.07, 0.05, 0.18);
    return vec4(clamp(col, 0.0, 1.0), a);
}
