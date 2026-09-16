vec4 tfxRenderWachlarzSzmaragd(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    float n = tfxHashF(gl_FragCoord.xy * 0.4 + vec2(floor(t * 6.0), 0.0));
    float tw = pow(n, 4.0) * (0.5 + 0.5 * sin(t * 5.0 + n * 30.0));
    vec3 col = vec3(0.05, 0.75, 0.35) * (0.7 + 0.3 * sin(t * 2.4 + tfxPos.x * 0.05)) + vec3(0.3, 0.8, 0.5) * tw;
    return vec4(clamp(col, 0.0, 1.0), a);
}
