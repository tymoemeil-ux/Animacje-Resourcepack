vec4 tfxRenderGlow(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    float p = 0.5 + 0.5 * sin(t * 2.6);
    float v = 0.35 + 0.65 * p * p;
    vec3 col = vec3(1.0, 0.90, 0.60) * v;
    col += vec3(0.30, 0.22, 0.10) * (1.0 - v);
    return vec4(clamp(col, 0.0, 1.0), a);
}