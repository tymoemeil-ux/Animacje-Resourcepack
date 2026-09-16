vec4 tfxRenderOlo(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    float v = 0.7 + 0.3 * sin(t * 2.0 + tfxPos.x * 0.07);
    vec3 col = vec3(0.55, 0.6, 0.68) * v + vec3(0.12, 0.13, 0.15);
    return vec4(clamp(col, 0.0, 1.0), a);
}
