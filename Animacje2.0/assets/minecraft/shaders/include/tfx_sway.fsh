vec4 tfxRenderSwayColor(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    vec3 col = tfxHsv(fract(0.33 + 0.03 * sin(tfxPos.x * 0.06 - t * 1.7)), 0.7, 0.9);
    return vec4(col, a);
}