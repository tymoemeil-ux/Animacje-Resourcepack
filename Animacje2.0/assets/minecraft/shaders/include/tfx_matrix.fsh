vec4 tfxRenderMatrix(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;

    float t = GameTime;
    float y = gl_FragCoord.y * 0.02 + tfxHashF(vec2(tfxPos.x, 3.0)) * 4.0;
    float bit = step(0.5, tfxHashF(vec2(floor(y * 2.0), floor(t * 9.0)) + floor(y * 2.0) * 7.0));
    float scan = 0.75 + 0.25 * sin(gl_FragCoord.y * 0.9);
    vec3 col = vec3(0.1, 0.95, 0.3) * bit * scan * (0.5 + 0.5 * sin(t * 3.0 + gl_FragCoord.y * 0.05));
    return vec4(col, a);
}
