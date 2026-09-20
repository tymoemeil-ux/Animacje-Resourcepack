vec4 tfxRenderRakietaTrawa(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;

    float t = GameTime;
    float h = 0.28 + 0.05 * sin(tfxPos.x * 0.05 - t * 2.0);
    vec3 col = tfxHsv(fract(h), 0.8, 0.55 + 0.35 * (0.5 + 0.5 * sin(t * 2.6 + tfxPos.x * 0.07)));
    return vec4(col, a);
}
