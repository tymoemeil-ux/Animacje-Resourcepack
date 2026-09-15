vec4 tfxRenderDeszczZiemiNeonyTokio(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    float alt = step(0.5, sin(t * 2.0));
    vec3 col = mix(vec3(1.0, 0.15, 0.7), vec3(0.1, 0.9, 1.0), alt) * (0.7 + 0.3 * sin(t * 7.0)) + vec3(0.08, 0.02, 0.1);
    return vec4(clamp(col, 0.0, 1.0), a);
}