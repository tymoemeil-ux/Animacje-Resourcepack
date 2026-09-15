vec4 tfxRenderFalaZlota(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float f = floor(GameTime * 8.0);
    float n = tfxHashF(gl_FragCoord.xy * 0.2 + vec2(f, f * 0.7));
    vec3 col = vec3(1.0, 0.8, 0.2) * (0.75 + 0.3 * n) + vec3(0.2, 0.12, 0.0);
    return vec4(clamp(col, 0.0, 1.0), a);
}