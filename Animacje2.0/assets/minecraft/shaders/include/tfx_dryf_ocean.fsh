vec4 tfxRenderDryfOcean(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    vec2 p = gl_FragCoord.xy;
    float t = GameTime;
    return vec4(base.rgb * (0.8 + 0.2 * sin(t * 0.8 + p.x * 0.03)), a);
}
