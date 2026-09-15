vec4 tfxRenderLawenda(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    float h = 0.75 + 0.05 * sin(t * 1.2);
    vec3 col = tfxHsv(fract(h), 0.45, 0.75 + 0.2 * sin(t * 1.5 + tfxPos.x * 0.04));
    return vec4(col, a);
}