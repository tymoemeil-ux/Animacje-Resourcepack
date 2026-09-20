vec4 tfxRenderHackGlitch(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    float p = step(0.62, tfxHashF(vec2(floor(gl_FragCoord.x * 0.20), floor(t * 25.0))));
    return vec4(mix(vec3(0.10, 0.9, 1.0), vec3(0.72, 1.0, 0.0), p), a);
}
