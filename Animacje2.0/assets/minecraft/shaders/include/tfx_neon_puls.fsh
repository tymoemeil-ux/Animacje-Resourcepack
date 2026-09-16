vec4 tfxRenderNeonPuls(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = fract(GameTime * 1.5);
    float env = exp(-7.0 * t);
    vec3 col = vec3(1.0, 0.15, 0.85) * (0.30 + 1.1 * env);
    return vec4(clamp(col, 0.0, 1.0), a);
}
