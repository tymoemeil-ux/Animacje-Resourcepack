vec4 tfxRenderHackTerminal(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    float p = 0.5 + 0.5 * sin(gl_FragCoord.x * 0.035 - t * 3.5);
    return vec4(vec3(0.22, 1.0, 0.30) * (0.62 + p * 0.38), a);
}
