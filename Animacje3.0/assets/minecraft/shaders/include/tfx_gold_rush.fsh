vec4 tfxRenderGoldRush(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    float p = 0.5 + 0.5 * sin(gl_FragCoord.x * 0.035 - t * 5.5);
    return vec4(vec3(1.0, 0.54, 0.05) * (0.65 + 0.35 * p), a);
}
