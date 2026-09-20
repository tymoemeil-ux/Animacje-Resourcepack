vec4 tfxRenderDym(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    float f = floor(t * 8.0);
    float n = tfxHashF(vec2(f, gl_FragCoord.y * 0.02));
    float v = 0.45 + 0.3 * sin(t * 3.0 + tfxPos.x * 0.05) + 0.2 * n;
    vec3 col = vec3(0.55, 0.6, 0.7) * clamp(v, 0.0, 1.0);
    return vec4(col, a);
}
