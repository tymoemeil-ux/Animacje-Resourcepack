vec4 tfxRenderPerla(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    vec2 p = gl_FragCoord.xy;
    float t = GameTime;
    vec3 c = tfxHsv(0.58, 0.12, 0.78 + 0.14 * sin(t * 0.9 + p.x * 0.004 + p.y * 0.002));
    return vec4(clamp(c, 0.0, 1.0), a);
}
