vec4 tfxRenderWschod(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;

    float t = GameTime;
    float yv = clamp(gl_FragCoord.y * 0.002, 0.0, 1.0);
    float h = fract(0.04 + 0.03 * sin(t * 0.8) + yv * 0.12);
    vec3 col = tfxHsv(h, 0.7, 0.7 + 0.3 * (1.0 - yv));
    return vec4(col, a);
}
