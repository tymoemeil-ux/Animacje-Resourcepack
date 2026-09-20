vec4 tfxRenderSwing(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    float p = 0.5 + 0.5 * sin(t * 4.0);
    return vec4(tfxHsv(fract(0.82 + p * 0.10), 0.62, 0.78 + p * 0.22), a);
}
