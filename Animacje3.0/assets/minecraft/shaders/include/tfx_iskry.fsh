vec4 tfxRenderIskry(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    float seed = tfxHashF(vec2(floor(tfxPos.x * 0.18), floor(tfxPos.y * 0.30)));
    float twinkle = 0.45 + 0.55 * sin(t * (4.0 + seed * 5.0) + seed * 20.0);
    float hue = fract(0.10 + seed * 0.12 + t * 0.06);
    vec3 col = tfxHsv(hue, 0.62, 0.72 + 0.28 * max(twinkle, 0.0));
    return vec4(col, a);
}
