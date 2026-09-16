vec4 tfxRenderStaticTv(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    vec2 p = gl_FragCoord.xy;
    float t = GameTime;
    float f = floor(t * 30.0);
    float n  = tfxHashF(p * 0.5 + vec2(f * 13.7, f * 7.3));
    float n2 = tfxHashF(p * 1.3 + vec2(f * 3.1, f * 17.9));
    float v = 0.45 + 0.55 * (n * 0.65 + n2 * 0.35);
    return vec4(vec3(0.75, 0.82, 0.95) * v, a);
}
