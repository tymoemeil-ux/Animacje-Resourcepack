vec4 tfxRenderHopwaveColor(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float ph = fract(tfxPos.x * 0.1 - GameTime * 0.75);
    float b = sin(min(ph / 0.3, 1.0) * 3.14159);
    vec3 col = vec3(0.1, 0.55, 0.3) + vec3(0.2, 0.6, 0.25) * b;
    return vec4(col, a);
}