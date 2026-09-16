vec4 tfxRenderWahadloZegar(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    vec2 p = gl_FragCoord.xy;
    float t = GameTime;
    vec3 c2 = vec3(0.70, 0.60, 0.45);
    vec3 c = mix(base.rgb, c2, 0.5 + 0.5 * sin(t * 1.4 + tfxPos.x * 0.5));
    return vec4(c, a);
}
