vec4 tfxRenderPerla(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    float h = fract(t * 0.08 + tfxPos.x * 0.01);
    float v = 0.75 + 0.2 * sin(t * 2.0 + gl_FragCoord.x * 0.01);
    vec3 col = tfxHsv(h, 0.25, v);
    return vec4(col, a);
}
