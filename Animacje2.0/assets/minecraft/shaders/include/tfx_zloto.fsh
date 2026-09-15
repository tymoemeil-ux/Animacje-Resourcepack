vec4 tfxRenderZloto(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    float d = fract((gl_FragCoord.x + gl_FragCoord.y * 0.6) * 0.003 - t * 0.3);
    float glint = pow(1.0 - smoothstep(0.0, 0.12, d), 2.0);
    vec3 col = vec3(0.85, 0.65, 0.15) + vec3(0.9, 0.75, 0.3) * glint;
    return vec4(clamp(col, 0.0, 1.0), a);
}