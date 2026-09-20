vec4 tfxRenderLampaBiala(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    vec2 p = gl_FragCoord.xy;
    float t = GameTime;
    float bx = fract(t * 0.16 + tfxPos.x * 0.011);
    float d = abs(fract(p.x * 0.021 + bx) - 0.5);
    float b = smoothstep(0.22, 0.0, d);
    return vec4(base.rgb * (0.30 + 1.15 * b), a);
}
