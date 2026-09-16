vec4 tfxRenderKonfetti(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    float n = tfxHashF(gl_FragCoord.xy * 0.1 + vec2(floor(t * 6.0), 0.0));
    return vec4(tfxHsv(n, 0.9, 0.95), a);
}
