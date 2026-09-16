vec4 tfxRenderWinda(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    float h = fract(0.55 + 0.15 * gl_FragCoord.y * 0.002);
    float v = 0.85 + 0.15 * sin(t * 2.0);
    return vec4(tfxHsv(h, 0.85, v), a);
}
