vec4 tfxRenderBumerangZachod(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;

    float t = GameTime;
    float yv = clamp(gl_FragCoord.y * 0.002, 0.0, 1.0);
    vec3 low = vec3(1.0, 0.45, 0.2);
    vec3 high = vec3(0.5, 0.15, 0.55);
    vec3 col = mix(low, high, yv) * (0.8 + 0.2 * sin(t * 1.4 + yv * 3.0));
    return vec4(col, a);
}
