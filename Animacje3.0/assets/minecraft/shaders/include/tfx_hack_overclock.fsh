vec4 tfxRenderHackOverclock(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    float p = 0.5 + 0.5 * sin(t * 14.0 + gl_FragCoord.x * 0.07);
    return vec4(vec3(1.0, 0.28, 0.0) * (0.52 + p * 0.48), a);
}
