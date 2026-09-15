vec4 tfxRenderFloatyColor(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float v = 0.7 + 0.3 * sin(GameTime * 2.0);
    vec3 col = vec3(0.35, 0.6, 1.0) * v + vec3(0.1, 0.15, 0.3);
    return vec4(clamp(col, 0.0, 1.0), a);
}