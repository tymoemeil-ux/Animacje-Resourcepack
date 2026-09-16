vec4 tfxRenderWstecz(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    vec3 col = tfxHsv(fract(0.6 + tfxPos.x * 0.03 + t * 0.15), 0.9, 0.85);
    return vec4(col, a);
}
