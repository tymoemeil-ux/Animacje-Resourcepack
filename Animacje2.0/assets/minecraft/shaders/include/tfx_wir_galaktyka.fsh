vec4 tfxRenderWirGalaktyka(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    vec2 p = gl_FragCoord.xy;
    float t = GameTime;
    vec3 c = tfxHsv(fract(0.6 + 0.06 * sin(t * 0.7) + tfxPos.x * 0.02), 0.6, 1.0);
    return vec4(mix(base.rgb, c, 0.55), a);
}
