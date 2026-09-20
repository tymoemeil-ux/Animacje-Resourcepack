vec4 tfxRenderJelly(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    float p = 0.5 + 0.5 * sin(t * 5.0);
    return vec4(vec3(0.30, 1.0, 0.78) * (0.62 + p * 0.38), a);
}
