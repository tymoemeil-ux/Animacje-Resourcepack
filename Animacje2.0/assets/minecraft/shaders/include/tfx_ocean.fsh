vec4 tfxRenderOcean(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    vec2 p = gl_FragCoord.xy;
    float t = GameTime;
    float c1 = sin(p.x * 0.020 + p.y * 0.008 + t * 2.2);
    float c2 = sin(p.x * 0.011 - p.y * 0.017 - t * 1.7);
    float c3 = sin((p.x - p.y) * 0.014 + t * 1.1);
    float caustic = pow(0.5 + 0.5 * (c1 * c2 * c3), 2.2);
    vec3 col = mix(vec3(0.05, 0.25, 0.55), vec3(0.35, 0.90, 1.0), caustic);
    return vec4(col, a);
}