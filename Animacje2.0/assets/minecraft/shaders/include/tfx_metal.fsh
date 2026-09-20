vec4 tfxRenderMetal(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    vec2 p = gl_FragCoord.xy;
    float t = GameTime;
    float b = sin(p.x * 0.016 - t * 1.4) * 0.5 + 0.5; vec3 c = mix(vec3(0.50, 0.52, 0.56), vec3(0.98, 0.99, 1.0), b * 0.75);
    return vec4(clamp(c, 0.0, 1.0), a);
}
