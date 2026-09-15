vec4 tfxRenderBumperColor(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    float v = 0.7 + 0.3 * sin(t * 8.0 + tfxPos.x * 0.2);
    vec3 col = vec3(1.0, 0.25, 0.65) * v + vec3(0.3, 0.1, 0.2);
    return vec4(clamp(col, 0.0, 1.0), a);
}