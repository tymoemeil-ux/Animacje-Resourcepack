vec4 tfxRenderBounce(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    float p = 0.5 + 0.5 * sin(t * 6.0);
    return vec4(vec3(1.0, 0.25, 0.62) * (0.62 + 0.38 * p), a);
}
