vec4 tfxRenderMostMagma(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;

    float t = GameTime;
    float n = tfxHashF(gl_FragCoord.xy * 0.35 + vec2(floor(t * 4.0) * 13.7, floor(t * 4.0) * 7.3));
    float heat = pow(0.5 + 0.5 * sin(t * 2.4 + n * 9.0), 2.0);
    vec3 col = mix(vec3(0.3, 0.03, 0.0), vec3(1.0, 0.35, 0.05), heat) + vec3(1.0, 0.6, 0.1) * pow(heat, 3.0) * 0.5;
    return vec4(col, a);
}
