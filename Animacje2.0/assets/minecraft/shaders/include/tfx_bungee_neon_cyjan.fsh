vec4 tfxRenderBungeeNeonCyjan(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    float scan = 0.8 + 0.2 * sin(gl_FragCoord.y * 0.8 - t * 5.0);
    vec3 col = vec3(0.1, 0.95, 1.0) * scan * (0.7 + 0.3 * sin(t * 4.0)) + vec3(0.02, 0.12, 0.15);
    return vec4(clamp(col, 0.0, 1.0), a);
}