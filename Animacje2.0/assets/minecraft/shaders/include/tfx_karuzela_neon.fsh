vec4 tfxRenderKaruzelaNeon(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    vec3 col = tfxHsv(fract(tfxPos.x * 0.04 - t * 0.4), 0.9, 0.9);
    return vec4(col, a);
}