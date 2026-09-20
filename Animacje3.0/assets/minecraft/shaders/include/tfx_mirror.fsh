vec4 tfxRenderMirror(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    float p = 0.5 + 0.5 * sin(abs(gl_FragCoord.x - 320.0) * 0.045 - t * 5.0);
    return vec4(vec3(0.24, 0.92, 0.86) * (0.62 + p * 0.38), a);
}
