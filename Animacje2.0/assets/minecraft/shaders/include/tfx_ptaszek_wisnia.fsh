vec4 tfxRenderPtaszekWisnia(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;

    float t = GameTime;
    float hl = pow(0.5 + 0.5 * sin(gl_FragCoord.y * 0.06 - t * 1.5 + tfxPos.x * 0.03), 3.0);
    vec3 col = mix(vec3(0.55, 0.02, 0.12), vec3(0.95, 0.2, 0.35), 0.5 + 0.5 * sin(t * 1.8)) + vec3(hl * 0.35);
    return vec4(col, a);
}
