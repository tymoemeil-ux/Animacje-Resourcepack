vec4 tfxRenderOrbitaColor(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    vec3 col = tfxHsv(fract(0.75 + tfxPos.x * 0.015 - t * 0.25), 0.85, 0.9);
    return vec4(col, a);
}