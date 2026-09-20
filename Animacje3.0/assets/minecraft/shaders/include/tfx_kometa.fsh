vec4 tfxRenderKometa(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    float x = gl_FragCoord.x * 0.005;
    float head = 1.0 - smoothstep(0.0, 0.10, fract(x - t * 0.75));
    float tail = 1.0 - smoothstep(0.0, 0.58, fract(x - t * 0.75 + 0.18));
    vec3 cold = vec3(0.15, 0.72, 1.0);
    vec3 hot = vec3(1.0, 0.92, 0.55);
    vec3 col = mix(cold, hot, head) * (0.72 + 0.42 * tail) + vec3(0.25) * head;
    return vec4(clamp(col, 0.0, 1.0), a);
}
