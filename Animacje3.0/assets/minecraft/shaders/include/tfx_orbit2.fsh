vec4 tfxRenderOrbit2(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    float h = fract(0.60 + atan(tfxPos.y, tfxPos.x) / 6.28318 + t * 0.12);
    return vec4(tfxHsv(h, 0.82, 0.94), a);
}
