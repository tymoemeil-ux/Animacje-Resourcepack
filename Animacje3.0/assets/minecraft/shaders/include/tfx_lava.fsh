vec4 tfxRenderLava(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    float p = 0.5 + 0.5 * sin(t * 3.0 + gl_FragCoord.x * 0.025);
    return vec4(mix(vec3(0.55, 0.03, 0.01), vec3(1.0, 0.55, 0.03), p), a);
}
