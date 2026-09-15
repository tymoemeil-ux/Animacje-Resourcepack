vec4 tfxRenderDrganiaMuzyczne(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float ph = fract(GameTime);
    float beat = pow(max(0.0, 1.0 - ph * 4.0), 3.0);
    vec3 col = vec3(0.9, 0.08, 0.55) * (0.6 + 0.5 * beat) + vec3(0.12, 0.02, 0.1);
    return vec4(clamp(col, 0.0, 1.0), a);
}