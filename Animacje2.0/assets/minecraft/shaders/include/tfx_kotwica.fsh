vec4 tfxRenderKotwica(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;

    float t = GameTime;
    float p = 0.5 + 0.5 * sin(t * 2.0 + tfxPos.x * 0.06);
    vec3 col = tfxHsv(fract(0.58 + 0.02 * sin(t * 0.9)), 0.75, 0.55 + 0.4 * p);
    return vec4(col, a);
}
