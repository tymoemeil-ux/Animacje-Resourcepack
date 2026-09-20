vec4 tfxRenderWielblikPryzmat(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;

    float t = GameTime;
    float h = fract(tfxPos.x * 0.02 - t * 0.25);
    vec3 col = tfxHsv(h, 0.85, 0.95);
    return vec4(col, a);
}
