vec4 tfxRenderNeonDeszcz(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    float v = 0.6 + 0.4 * sin(gl_FragCoord.y * 0.3 - t * 12.0);
    vec3 col = vec3(0.2, 0.9, 1.0) * v + vec3(0.02, 0.08, 0.12);
    return vec4(clamp(col, 0.0, 1.0), a);
}