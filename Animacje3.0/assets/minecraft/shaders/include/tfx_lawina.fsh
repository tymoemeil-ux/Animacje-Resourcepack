vec4 tfxRenderLawina(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float f = floor(GameTime * 10.0);
    float n = tfxHashF(gl_FragCoord.xy * 0.5 + vec2(f * 0.3, f * 0.1));
    vec3 col = vec3(0.75, 0.85, 1.0) * (0.8 + 0.25 * n);
    return vec4(clamp(col, 0.0, 1.0), a);
}
