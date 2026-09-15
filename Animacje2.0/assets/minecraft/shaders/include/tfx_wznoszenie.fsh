vec4 tfxRenderWznoszenie(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    vec3 col = vec3(0.85, 0.9, 1.0) * (0.65 + 0.3 * sin(t * 3.0)) + vec3(0.15, 0.17, 0.22);
    return vec4(clamp(col, 0.0, 1.0), a);
}