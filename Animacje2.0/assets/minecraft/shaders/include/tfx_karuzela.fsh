vec4 tfxRenderKaruzelaColor(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    vec3 col = tfxHsv(fract(0.6 + tfxPos.x * 0.02 - t * 0.3), 0.85, 0.9);
    return vec4(col, a);
}