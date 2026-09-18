vec4 tfxRenderIskry(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    vec2 p = gl_FragCoord.xy;
    float t = GameTime;
    vec3 c = tfxHsv(0.12, 0.50, 0.78); float h = tfxHashF(floor(p * 0.35)); c += smoothstep(0.994, 1.0, h) * (0.5 + 0.5 * sin(t * 5.0 + h * 40.0)) * 0.7;
    return vec4(clamp(c, 0.0, 1.0), a);
}
