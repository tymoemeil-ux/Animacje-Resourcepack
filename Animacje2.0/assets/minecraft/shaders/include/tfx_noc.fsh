vec4 tfxRenderNoc(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    vec2 p = gl_FragCoord.xy;
    float t = GameTime;
    vec3 c = tfxHsv(0.65, 0.45, 0.38); float h = tfxHashF(floor(p * 0.5)); c += smoothstep(0.9975, 1.0, h) * (0.6 + 0.4 * sin(t * 3.5 + h * 30.0)) * 0.9;
    return vec4(clamp(c, 0.0, 1.0), a);
}
