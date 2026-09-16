vec4 tfxRenderSpiralaRubin(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    float inner = pow(0.5 + 0.5 * sin(t * 3.0), 2.0);
    vec3 col = vec3(0.7, 0.02, 0.1) * (0.6 + 0.5 * inner) + vec3(0.25, 0.0, 0.03) + vec3(0.4, 0.05, 0.1) * inner;
    return vec4(clamp(col, 0.0, 1.0), a);
}
