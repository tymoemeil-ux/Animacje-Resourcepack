vec4 tfxRenderHackMatrix(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    float p = step(0.56, fract(gl_FragCoord.y * 0.09 + t * 1.9 + tfxHashF(vec2(floor(gl_FragCoord.x * 0.08), 0.0))));
    return vec4(vec3(0.05, 0.95, 0.20) * (0.45 + p * 0.55), a);
}
