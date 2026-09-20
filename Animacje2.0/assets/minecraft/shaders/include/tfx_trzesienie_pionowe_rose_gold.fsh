vec4 tfxRenderTrzesieniePionoweRoseGold(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    vec3 col = vec3(0.95, 0.6, 0.55) * (0.7 + 0.3 * sin(t * 2.8 + tfxPos.x * 0.06)) + vec3(0.2, 0.1, 0.1);
    return vec4(clamp(col, 0.0, 1.0), a);
}
