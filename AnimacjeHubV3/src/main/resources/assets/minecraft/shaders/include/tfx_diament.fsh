vec4 tfxRenderDiament(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    vec2 p = gl_FragCoord.xy;
    float t = GameTime;
    float d = fract((p.x + p.y * 0.6) * 0.004 - t * 0.45);
    float streak = pow(1.0 - smoothstep(0.0, 0.10, d), 3.0);
    float trail = pow(max(0.0, 1.0 - d * 2.5), 2.0) * 0.35;
    vec3 col = vec3(0.30, 0.45, 0.85) + vec3(0.75, 0.85, 1.0) * (streak + trail);
    return vec4(clamp(col, 0.0, 1.0), a);
}
