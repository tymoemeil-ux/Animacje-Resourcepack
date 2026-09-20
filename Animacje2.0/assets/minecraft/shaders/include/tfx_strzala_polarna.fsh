vec4 tfxRenderStrzalaPolarna(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;

    float t = GameTime;
    float band = 0.5 + 0.5 * sin(gl_FragCoord.y * 0.02 - t * 1.3 + sin(gl_FragCoord.x * 0.013 + t * 0.8) * 2.0);
    vec3 col = mix(vec3(0.05, 0.8, 0.45), vec3(0.3, 0.4, 1.0), band);
    col *= 0.65 + 0.35 * band;
    return vec4(col, a);
}
