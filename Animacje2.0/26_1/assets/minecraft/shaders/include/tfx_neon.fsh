
vec4 tfxRenderNeon(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float p = 0.5 + 0.5 * sin(GameTime * 5.0);
    vec3 col = vec3(0.10, 0.75, 1.0) * (0.50 + 0.60 * p) + vec3(0.60, 0.95, 1.0) * p * 0.5;
    return vec4(clamp(col, 0.0, 1.0), a);
}
