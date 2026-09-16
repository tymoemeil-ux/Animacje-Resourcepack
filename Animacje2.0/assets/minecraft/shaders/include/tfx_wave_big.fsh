vec4 tfxRenderWaveBigColor(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    vec3 col = tfxHsv(fract(0.55 + 0.05 * sin(tfxPos.x * 0.05 - t * 2.2)), 0.8, 0.9);
    return vec4(col, a);
}
