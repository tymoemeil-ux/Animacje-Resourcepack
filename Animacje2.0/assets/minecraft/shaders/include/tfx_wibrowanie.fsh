vec4 tfxRenderWibrowanie(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    vec3 col = vec3(0.6, 0.2, 1.0) * (0.7 + 0.3 * sin(t * 9.0)) + vec3(0.12, 0.03, 0.2);
    return vec4(clamp(col, 0.0, 1.0), a);
}
