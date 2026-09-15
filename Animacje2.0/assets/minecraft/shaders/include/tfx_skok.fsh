vec4 tfxRenderSkokColor(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float ph = fract(GameTime * 0.85);
    float b = sin(min(ph / 0.42, 1.0) * 3.14159);
    vec3 col = vec3(0.9, 0.4, 0.05) + vec3(0.6, 0.45, 0.1) * b;
    return vec4(col, a);
}