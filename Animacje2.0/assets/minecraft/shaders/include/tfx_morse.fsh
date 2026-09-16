vec4 tfxRenderMorse(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    float ph = fract(t * 0.7);
    float on = (smoothstep(0.02, 0.06, ph) - smoothstep(0.15, 0.19, ph))
             + (smoothstep(0.24, 0.28, ph) - smoothstep(0.37, 0.41, ph))
             + (smoothstep(0.52, 0.56, ph) - smoothstep(0.88, 0.92, ph));
    on = clamp(on, 0.0, 1.0);
    vec3 col = vec3(0.55, 0.85, 1.0) * (0.22 + 0.78 * on);
    col += vec3(0.08, 0.18, 0.30) * (1.0 - on);
    return vec4(clamp(col, 0.0, 1.0), a);
}
