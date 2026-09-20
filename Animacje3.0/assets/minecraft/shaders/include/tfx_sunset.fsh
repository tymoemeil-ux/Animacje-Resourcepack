vec4 tfxRenderSunset(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    float p = 0.5 + 0.5 * sin(t * 0.8 + gl_FragCoord.x * 0.018);
    return vec4(mix(vec3(1.0, 0.25, 0.08), vec3(0.98, 0.82, 0.22), p), a);
}
