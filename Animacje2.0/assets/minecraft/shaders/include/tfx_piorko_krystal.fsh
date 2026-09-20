vec4 tfxRenderPiorkoKrystal(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;

    float t = GameTime;
    float f = tfxHashF(floor(gl_FragCoord.xy * 0.5) + vec2(floor(t * 5.0), 0.0));
    vec3 col = mix(vec3(0.45, 0.75, 1.0), vec3(0.9, 0.98, 1.0), f * (0.5 + 0.5 * sin(t * 4.0 + f * 6.0)));
    return vec4(col, a);
}
