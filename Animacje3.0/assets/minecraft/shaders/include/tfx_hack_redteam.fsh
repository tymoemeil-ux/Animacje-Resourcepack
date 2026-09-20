vec4 tfxRenderHackRedteam(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    float p = 0.5 + 0.5 * sin(t * 8.0);
    return vec4(vec3(1.0, 0.03, 0.08) * (0.55 + p * 0.45), a);
}
