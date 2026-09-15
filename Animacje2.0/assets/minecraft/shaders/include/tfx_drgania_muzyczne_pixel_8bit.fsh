vec4 tfxRenderDrganiaMuzycznePixel8bit(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float f = floor(GameTime * 2.0);
    vec2 q = floor(gl_FragCoord.xy * 0.25);
    float n = tfxHashF(q + vec2(f, f * 0.7));
    vec3 pal = vec3(step(0.7, n), step(0.4, n) - step(0.7, n), step(0.1, n));
    vec3 col = pal * 0.85 + vec3(0.08);
    return vec4(col, a);
}