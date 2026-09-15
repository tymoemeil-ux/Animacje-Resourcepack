vec4 tfxRenderFalaFioletowa(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    vec3 col = tfxHsv(fract(0.78 + 0.04 * sin(tfxPos.x * 0.08 - t * 4.5)), 0.85, 0.9);
    return vec4(col, a);
}