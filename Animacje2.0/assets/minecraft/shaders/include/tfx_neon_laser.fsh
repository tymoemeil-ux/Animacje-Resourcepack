vec4 tfxRenderNeonLaser(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    float d = fract(gl_FragCoord.y * 0.004 - t * 1.2);
    float line = pow(1.0 - smoothstep(0.0, 0.08, d), 2.0);
    vec3 col = vec3(0.5, 0.05, 0.1) + vec3(1.0, 0.2, 0.3) * (line + 0.3);
    return vec4(clamp(col, 0.0, 1.0), a);
}