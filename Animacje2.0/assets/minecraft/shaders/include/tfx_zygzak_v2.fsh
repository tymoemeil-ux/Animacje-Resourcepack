vec4 tfxRenderZygzakV2(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    vec3 col = vec3(0.6, 1.0, 0.1) * (0.6 + 0.4 * abs(sin(t * 2.2))) + vec3(0.1, 0.15, 0.0);
    return vec4(clamp(col, 0.0, 1.0), a);
}