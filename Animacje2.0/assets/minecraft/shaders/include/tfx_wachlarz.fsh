vec4 tfxRenderWachlarz(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    vec3 col = vec3(0.2, 0.45, 1.0) * (0.7 + 0.3 * sin(t * 2.5 + tfxPos.x * 0.04)) + vec3(0.05, 0.08, 0.2);
    return vec4(clamp(col, 0.0, 1.0), a);
}
