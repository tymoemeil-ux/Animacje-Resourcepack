vec4 tfxRenderTerminal(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;

    float t = GameTime;
    float blink = step(0.5, fract(t * 1.2 + tfxPos.x * 0.3));
    float glow = 0.75 + 0.25 * sin(t * 8.0 + tfxPos.x);
    vec3 col = vec3(0.2, 0.95, 0.4) * (0.7 + 0.3 * blink) * glow;
    return vec4(col, a);
}
