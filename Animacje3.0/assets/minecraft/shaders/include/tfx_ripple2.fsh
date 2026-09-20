vec4 tfxRenderRipple2(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    float p = 0.5 + 0.5 * sin(length(vec2(gl_FragCoord.x, gl_FragCoord.y)) * 0.08 - t * 6.0);
    return vec4(vec3(0.08, 0.85, 0.72) * (0.62 + 0.38 * p), a);
}
