vec4 tfxRenderPrism2(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    float h = fract(0.78 + t * 0.16 + sin(gl_FragCoord.x * 0.04) * 0.18);
    return vec4(tfxHsv(h, 0.78, 0.98), a);
}
