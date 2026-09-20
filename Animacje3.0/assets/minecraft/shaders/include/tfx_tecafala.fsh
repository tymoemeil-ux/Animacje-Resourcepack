vec4 tfxRenderTecfala(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float d = gl_FragCoord.x * 0.008 + gl_FragCoord.y * 0.002;
    float h = fract(d - GameTime * 0.35);
    return vec4(tfxHsv(h, 1.0, 1.0), a);
}
