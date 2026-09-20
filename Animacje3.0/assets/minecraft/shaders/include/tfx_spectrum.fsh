vec4 tfxRenderSpectrum(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    float h = fract(t * 0.10 + tfxPos.x * 0.012);
    return vec4(tfxHsv(h, 0.88, 0.98), a);
}
