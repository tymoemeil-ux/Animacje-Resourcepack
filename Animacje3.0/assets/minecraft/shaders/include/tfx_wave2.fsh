vec4 tfxRenderWave2(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    float p = 0.5 + 0.5 * sin(tfxPos.x * 0.075 - t * 5.5);
    return vec4(tfxHsv(fract(0.50 + p * 0.10), 0.82, 0.78 + p * 0.22), a);
}
