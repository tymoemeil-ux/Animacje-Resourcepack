vec4 tfxRenderRadar(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    vec2 p = gl_FragCoord.xy;
    float t = GameTime;
    float d = fract((p.x + p.y) * 0.0035 - t * 0.55);
    float line = pow(1.0 - smoothstep(0.0, 0.05, d), 2.0);
    float trail = pow(max(0.0, 1.0 - d * 3.0), 3.0) * 0.55;
    vec3 col = vec3(0.10, 0.45, 0.40) + vec3(0.15, 1.0, 0.85) * (line + trail);
    return vec4(clamp(col, 0.0, 1.0), a);
}