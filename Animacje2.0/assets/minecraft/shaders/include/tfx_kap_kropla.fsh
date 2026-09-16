vec4 tfxRenderKapKropla(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    vec2 p = gl_FragCoord.xy;
    float t = GameTime;
    float b = 0.5 + 0.5 * sin(t * 1.8 + tfxPos.x * 0.5);
    return vec4(base.rgb * (0.7 + 0.4 * b), a);
}
