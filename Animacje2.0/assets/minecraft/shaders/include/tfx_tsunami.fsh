vec4 tfxRenderTsunamiColor(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    vec3 col = tfxHsv(fract(0.58 + 0.05 * sin(tfxPos.x * 0.04 - t * 1.5)), 0.9, 0.9);
    return vec4(col, a);
}
