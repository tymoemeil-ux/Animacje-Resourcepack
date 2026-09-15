vec4 tfxRenderTancuj(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    float h = fract(tfxPos.x * 0.06 - t * 0.4);
    vec3 col = tfxHsv(h, 1.0, 0.95);
    return vec4(col, a);
}