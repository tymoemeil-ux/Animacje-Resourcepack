
vec4 tfxRenderGalaktyka(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    vec2 px = floor(gl_FragCoord.xy / 3.0);
    float star = step(0.985, tfxHashF(px + vec2(floor(GameTime * 4.0))));
    float neb = 0.5 + 0.5 * sin(gl_FragCoord.x * 0.02 + GameTime * 1.5) * sin(gl_FragCoord.y * 0.03 - GameTime);
    vec3 col = mix(vec3(0.25, 0.10, 0.60), vec3(0.10, 0.40, 0.90), neb) * (0.70 + 0.30 * neb);
    col += vec3(1.0) * star * 1.2;
    return vec4(clamp(col, 0.0, 1.0), a);
}
