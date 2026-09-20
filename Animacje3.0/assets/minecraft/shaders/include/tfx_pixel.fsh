vec4 tfxRenderPixel(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    float p = floor((0.5 + 0.5 * sin(t * 4.0 + gl_FragCoord.x * 0.03)) * 5.0) / 5.0;
    return vec4(tfxHsv(fract(0.58 + p * 0.22), 0.9, 0.72 + p * 0.28), a);
}
