vec4 tfxRenderFirefly(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    float seed = tfxHashF(vec2(floor(tfxPos.x * 0.22), floor(tfxPos.y * 0.35)));
    float p = max(0.0, sin(t * (3.0 + seed * 5.0) + seed * 24.0));
    return vec4(vec3(0.72, 1.0, 0.22) * (0.42 + p * 0.72), a);
}
