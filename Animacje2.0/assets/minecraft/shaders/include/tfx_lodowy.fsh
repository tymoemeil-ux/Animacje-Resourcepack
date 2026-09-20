vec4 tfxRenderLodowy(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    vec2 p = gl_FragCoord.xy;
    float t = GameTime;
    vec3 c = tfxHsv(0.55, 0.32, 0.72 + 0.16 * sin(p.x * 0.014 - t * 0.8 + sin(p.y * 0.020 + t * 0.35) * 1.3));
    return vec4(clamp(c, 0.0, 1.0), a);
}
