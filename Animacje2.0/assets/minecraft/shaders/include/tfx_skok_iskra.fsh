vec4 tfxRenderSkokIskra(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    vec2 p = gl_FragCoord.xy;
    float t = GameTime;
    return vec4(base.rgb * (0.9 + 0.2 * sin(t * 4.8 + tfxPos.x * 1.4)), a);
}
