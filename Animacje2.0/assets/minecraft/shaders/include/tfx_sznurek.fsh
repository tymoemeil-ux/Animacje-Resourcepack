vec4 tfxRenderSznurek(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    vec3 col = tfxHsv(fract(0.48 + 0.03 * sin(t * 2.2 + tfxPos.x * 0.05)), 0.8, 0.85);
    return vec4(col, a);
}
