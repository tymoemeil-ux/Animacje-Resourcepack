vec4 tfxRenderDrganieTremoru(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    vec2 p = gl_FragCoord.xy;
    float t = GameTime;
    return vec4(base.rgb * (0.75 + 0.35 * tfxHashF(vec2(floor(t * 10.0), tfxPos.x * 0.13))), a);
}
