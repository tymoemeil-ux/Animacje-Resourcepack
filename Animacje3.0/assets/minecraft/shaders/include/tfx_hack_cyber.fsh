vec4 tfxRenderHackCyber(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    float p = 0.5 + 0.5 * sin(gl_FragCoord.x * 0.055 - t * 7.0);
    return vec4(mix(vec3(0.0, 0.95, 1.0), vec3(1.0, 0.0, 0.72), p), a);
}
