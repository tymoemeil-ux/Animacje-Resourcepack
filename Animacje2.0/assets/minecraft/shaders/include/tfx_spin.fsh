vec4 tfxRenderSpinColor(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    vec3 col = tfxHsv(fract(0.9 + tfxPos.x * 0.02 + t * 0.5), 0.9, 0.9);
    return vec4(col, a);
}