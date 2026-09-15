vec4 tfxRenderDeszczZiemi(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    vec3 col = vec3(0.45, 0.35, 0.22) * (0.7 + 0.3 * sin(t * 2.0 + tfxPos.x * 0.03)) + vec3(0.1, 0.07, 0.04);
    return vec4(clamp(col, 0.0, 1.0), a);
}