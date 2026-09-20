vec4 tfxRenderSkanerNeon(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    vec2 p = gl_FragCoord.xy;
    float t = GameTime;
    float b = smoothstep(0.16, 0.0, abs(fract(p.y * 0.028 + t * 0.30) - 0.5));
    return vec4(base.rgb * (0.35 + 1.05 * b), a);
}
