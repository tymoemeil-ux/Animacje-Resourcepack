vec4 tfxRenderGradient(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    float h = fract(0.06 + gl_FragCoord.x * 0.0025 + t * 0.05);
    return vec4(tfxHsv(h, 0.70, 0.96), a);
}
