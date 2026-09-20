vec4 tfxRenderStarlight(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    float seed = tfxHashF(vec2(floor(gl_FragCoord.x * 0.12), floor(gl_FragCoord.y * 0.12)));
    float p = pow(max(0.0, sin(t * (2.0 + seed * 6.0) + seed * 30.0)), 5.0);
    return vec4(vec3(0.62, 0.78, 1.0) + vec3(1.0) * p * 0.45, a);
}
