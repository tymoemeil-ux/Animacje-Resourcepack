vec4 tfxRenderKarmazyn(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    vec3 col = vec3(0.6, 0.02, 0.08) * (0.7 + 0.3 * sin(t * 3.0 + tfxPos.x * 0.05)) + vec3(0.25, 0.0, 0.03);
    return vec4(clamp(col, 0.0, 1.0), a);
}