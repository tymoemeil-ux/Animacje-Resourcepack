vec4 tfxRenderPryzmat(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    float sweep = sin(gl_FragCoord.x * 0.018 - t * 2.2);
    float h = fract(0.56 + t * 0.12 + sweep * 0.16);
    float shine = 0.78 + 0.22 * sin(gl_FragCoord.x * 0.05 - t * 5.0);
    return vec4(tfxHsv(h, 0.82, shine), a);
}
