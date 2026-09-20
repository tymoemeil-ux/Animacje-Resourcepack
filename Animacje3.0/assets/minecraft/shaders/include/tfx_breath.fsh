vec4 tfxRenderBreath(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    float p = 0.5 + 0.5 * sin(t * 1.8);
    return vec4(vec3(0.46, 0.66, 0.88) * (0.56 + p * 0.44), a);
}
