vec4 tfxRenderMoonlight(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    float p = 0.5 + 0.5 * sin(t * 1.4);
    return vec4(vec3(0.36, 0.50, 1.0) * (0.72 + 0.28 * p), a);
}
