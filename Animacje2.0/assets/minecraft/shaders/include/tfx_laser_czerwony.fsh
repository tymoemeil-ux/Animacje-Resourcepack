vec4 tfxRenderLaserCzerwony(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    vec2 p = gl_FragCoord.xy;
    float t = GameTime;
    float d = abs(fract(p.x * 0.016 - t * 0.35) - 0.5);
    float b = smoothstep(0.05, 0.0, d);
    return vec4(base.rgb * (0.22 + 1.5 * b), a);
}
