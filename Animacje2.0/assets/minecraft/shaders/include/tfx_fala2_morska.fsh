vec4 tfxRenderFala2Morska(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    vec2 p = gl_FragCoord.xy;
    float t = GameTime;
    vec3 c2 = vec3(0.05, 0.35, 0.75);
    vec3 c = mix(base.rgb, c2, 0.5 + 0.5 * sin(t * 0.9 + p.x * 0.02));
    return vec4(c * (0.85 + 0.15 * sin(t * 2.0)), a);
}
