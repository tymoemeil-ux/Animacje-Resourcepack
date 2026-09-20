vec4 tfxRenderGlitchBinarny(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;

    float t = GameTime;
    float slice = floor(gl_FragCoord.y * 0.15);
    float n = tfxHashF(vec2(slice, floor(t * 10.0)));
    float glitch = step(0.82, n);
    vec3 col = mix(vec3(0.1, 0.9, 0.35), vec3(0.9, 1.0, 0.95), glitch);
    col *= 0.7 + 0.3 * sin(t * 30.0 + gl_FragCoord.x * 0.1);
    return vec4(col, a);
}
