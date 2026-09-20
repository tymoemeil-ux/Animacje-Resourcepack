vec4 tfxRenderWibrowanieMiedz(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    vec3 col = vec3(0.8, 0.45, 0.25) * (0.7 + 0.3 * sin(t * 2.6 + tfxPos.x * 0.06)) + vec3(0.15, 0.07, 0.03);
    return vec4(clamp(col, 0.0, 1.0), a);
}
