vec4 tfxRenderFalowanieGoraNeonFiolet(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    float h = 0.78 + 0.03 * sin(t * 3.0);
    vec3 col = tfxHsv(fract(h), 0.9, 0.55 + 0.45 * (0.5 + 0.5 * sin(t * 3.0)));
    return vec4(col, a);
}
