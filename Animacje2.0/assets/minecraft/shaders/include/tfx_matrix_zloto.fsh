vec4 tfxRenderMatrixZloto(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    vec2 p = gl_FragCoord.xy;
    float t = GameTime;
    float col = floor(p.x / 4.0);
    float yf = fract(p.y * 0.045 - t * 0.9 + tfxHashF(vec2(col, 3.7)) * 5.0);
    float b = smoothstep(0.35, 0.0, yf);
    return vec4(base.rgb * (0.25 + 1.35 * b) + vec3(0.0, 0.0, 0.03), a);
}
