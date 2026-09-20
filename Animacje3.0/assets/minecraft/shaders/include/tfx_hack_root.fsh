vec4 tfxRenderHackRoot(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    float h = fract(0.76 + t * 0.08 + sin(gl_FragCoord.x * 0.025) * 0.10);
    return vec4(tfxHsv(h, 0.86, 0.96), a);
}
