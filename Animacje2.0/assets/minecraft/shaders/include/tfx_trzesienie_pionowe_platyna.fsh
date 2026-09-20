vec4 tfxRenderTrzesieniePionowePlatyna(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    float v = 0.7 + 0.3 * sin(t * 2.2 + tfxPos.x * 0.08);
    vec3 col = vec3(0.75, 0.78, 0.82) * v + vec3(0.18, 0.18, 0.2);
    return vec4(clamp(col, 0.0, 1.0), a);
}
