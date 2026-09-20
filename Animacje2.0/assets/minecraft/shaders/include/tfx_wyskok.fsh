vec4 tfxRenderWyskok(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float ph = fract(GameTime * 0.5);
    float b = sin(min(ph / 0.5, 1.0) * 3.14159);
    vec3 col = vec3(1.0, 0.55, 0.15) * (0.7 + 0.3 * b);
    return vec4(clamp(col, 0.0, 1.0), a);
}
