vec4 tfxRenderNeonfala(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float d = gl_FragCoord.x * 0.004;
    float t = GameTime * 2.2;
    float h = fract(0.55 + 0.25 * sin(d - t) + 0.10 * sin(d * 0.5 + t * 0.7));
    float v = 0.70 + 0.30 * (0.5 + 0.5 * sin(d - t));
    return vec4(tfxHsv(h, 0.90, v), a);
}
