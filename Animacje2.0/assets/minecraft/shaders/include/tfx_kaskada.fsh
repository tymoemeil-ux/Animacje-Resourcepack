vec4 tfxRenderKaskada(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float d = gl_FragCoord.x * 0.005 + gl_FragCoord.y * 0.009;
    float p = fract(d - GameTime * 1.4);
    float stripes = smoothstep(0.0, 0.5, sin(p * 3.14159));
    float glint = 1.0 - smoothstep(0.0, 0.25, abs(p - 0.5));
    vec3 col = base.rgb * (0.45 + 0.55 * stripes) + vec3(1.0, 0.90, 0.60) * glint * 0.9;
    return vec4(clamp(col, 0.0, 1.0), a);
}
