vec4 tfxRenderLuna(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    float v = 0.7 + 0.2 * sin(t * 1.5 + gl_FragCoord.x * 0.01);
    vec3 col = vec3(0.75, 0.8, 0.95) * v;
    return vec4(clamp(col, 0.0, 1.0), a);
}