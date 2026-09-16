vec4 tfxRenderRippleColor(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    vec3 col = tfxHsv(fract(0.47 + 0.05 * sin(tfxPos.x * 0.1 - t * 7.0)), 0.8, 0.9);
    return vec4(col, a);
}
