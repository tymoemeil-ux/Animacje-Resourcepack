vec4 tfxRenderHackZeroday(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    float p = tfxHashF(vec2(floor(gl_FragCoord.x * 0.12), floor(t * 18.0)));
    return vec4(mix(vec3(0.95, 0.0, 0.55), vec3(1.0, 0.92, 0.05), step(0.58, p)), a);
}
