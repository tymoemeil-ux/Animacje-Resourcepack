vec4 tfxRenderTarcza(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float f = floor(GameTime * 9.0);
    float n = tfxHashF(gl_FragCoord.xy * 0.15 + vec2(f, f * 0.3));
    vec3 col = vec3(0.2, 0.85, 1.0) * (0.7 + 0.3 * n);
    return vec4(col, a);
}
