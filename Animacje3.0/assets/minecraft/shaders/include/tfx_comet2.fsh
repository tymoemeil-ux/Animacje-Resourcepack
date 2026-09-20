vec4 tfxRenderComet2(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    float p = 0.5 + 0.5 * sin(gl_FragCoord.x * 0.025 - t * 9.0);
    return vec4(mix(vec3(0.12, 0.70, 1.0), vec3(1.0, 0.55, 0.18), p), a);
}
