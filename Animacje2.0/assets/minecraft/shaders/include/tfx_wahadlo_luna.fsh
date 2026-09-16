vec4 tfxRenderWahadloLuna(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    vec2 p = gl_FragCoord.xy;
    float t = GameTime;
    vec3 c2 = vec3(0.50, 0.55, 0.85);
    vec3 c = mix(base.rgb, c2, 0.5 + 0.5 * sin(t * 1.4 + tfxPos.x * 0.5));
    return vec4(c, a);
}
