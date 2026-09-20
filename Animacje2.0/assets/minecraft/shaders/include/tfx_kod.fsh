vec4 tfxRenderKod(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;

    float t = GameTime;
    float h = 0.28 + 0.10 * sin(t * 6.0 + tfxPos.x * 0.15);
    vec3 col = tfxHsv(fract(h), 1.0, 0.7 + 0.3 * sin(t * 9.0 + gl_FragCoord.y * 0.03));
    return vec4(col, a);
}
