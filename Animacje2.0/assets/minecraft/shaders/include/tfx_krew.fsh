vec4 tfxRenderKrew(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float m = tfxHashF(floor(gl_FragCoord.xy / 6.0) + vec2(floor(GameTime * 2.0)));
    float pulse = 0.60 + 0.40 * sin(GameTime * 2.8);
    vec3 col = mix(vec3(0.50, 0.02, 0.04), vec3(0.95, 0.08, 0.10), m * pulse);
    return vec4(col, a);
}
