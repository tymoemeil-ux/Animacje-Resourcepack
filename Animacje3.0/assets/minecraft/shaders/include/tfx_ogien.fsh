vec4 tfxRenderOgien(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    vec2 p = gl_FragCoord.xy;
    float t = GameTime;
    float n  = tfxHashF(floor(p * 0.35) + vec2(0.0, floor(t * 14.0)));
    float n2 = tfxHashF(floor(p * 0.80) + vec2(7.0, floor(t * 21.0)));
    float fire = clamp(n * 0.7 + n2 * 0.3, 0.0, 1.0);
    fire = pow(fire, 1.4);
    vec3 col = mix(vec3(0.35, 0.05, 0.02), vec3(1.0, 0.45, 0.05), smoothstep(0.25, 0.6, fire));
    col = mix(col, vec3(1.0, 0.85, 0.25), smoothstep(0.6, 0.95, fire));
    return vec4(col * (0.45 + 0.55 * fire), a);
}
