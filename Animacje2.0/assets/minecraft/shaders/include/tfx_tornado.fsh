vec4 tfxRenderTornadoColor(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    vec3 col = tfxHsv(fract(0.3 + tfxPos.x * 0.03 - t * 0.5), 0.8, 0.85);
    return vec4(col, a);
}