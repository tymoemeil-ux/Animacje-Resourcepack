vec4 tfxRenderPoranek(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    vec2 p = gl_FragCoord.xy;
    float t = GameTime;
    vec3 c = mix(vec3(1.0, 0.72, 0.50), vec3(1.0, 0.88, 0.72), uv.y); c *= 0.92 + 0.08 * sin(t * 0.6 + p.x * 0.006);
    return vec4(clamp(c, 0.0, 1.0), a);
}
