vec4 tfxRenderZegarMroz(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;

    float t = GameTime;
    float n = tfxHashF(gl_FragCoord.xy * 0.5);
    float tw = pow(n, 6.0) * (0.5 + 0.5 * sin(t * 6.0 + n * 40.0));
    vec3 col = vec3(0.7, 0.85, 1.0) + vec3(tw * 0.6);
    return vec4(col, a);
}
