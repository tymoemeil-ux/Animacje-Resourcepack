vec4 tfxRenderWaveColor(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    float ph = sin(tfxPos.x * 0.08 - t * 5.0);
    vec3 col = tfxHsv(fract(0.52 + 0.06 * ph), 0.85, 0.95);
    col *= 0.85 + 0.15 * (0.5 + 0.5 * ph);
    return vec4(clamp(col, 0.0, 1.0), a);
}
