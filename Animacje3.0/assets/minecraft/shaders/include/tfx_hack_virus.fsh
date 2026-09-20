vec4 tfxRenderHackVirus(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    float p = 0.5 + 0.5 * sin(t * 10.0 + gl_FragCoord.x * 0.035);
    return vec4(mix(vec3(0.75, 1.0, 0.0), vec3(1.0, 0.03, 0.10), p), a);
}
