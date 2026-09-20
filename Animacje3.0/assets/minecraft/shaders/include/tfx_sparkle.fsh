vec4 tfxRenderSparkle(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    float seed = tfxHashF(vec2(floor(gl_FragCoord.x * 0.18), floor(gl_FragCoord.y * 0.18)));
    float p = pow(max(0.0, sin(t * (4.0 + seed * 4.0) + seed * 12.0)), 7.0);
    return vec4(vec3(0.92, 0.96, 1.0) * (0.68 + p * 0.32), a);
}
