vec4 tfxRenderZerojedynka(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;

    float t = GameTime;
    float bit = step(0.5, fract(t * 2.5 + tfxPos.x * 0.35));
    float bright = bit * (0.5 + 0.5 * sin(t * 5.0));
    vec3 col = mix(vec3(0.02, 0.15, 0.05), vec3(0.25, 1.0, 0.5), bit);
    col += vec3(0.1, 0.2, 0.1) * bright;
    return vec4(col, a);
}
