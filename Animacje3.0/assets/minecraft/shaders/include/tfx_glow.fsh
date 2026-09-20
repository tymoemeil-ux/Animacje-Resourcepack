vec4 tfxRenderGlow(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    float p = 0.5 + 0.5 * sin(t * 2.6);
    return vec4(vec3(0.32, 0.78, 1.0) * (0.60 + 0.40 * p), a);
}
