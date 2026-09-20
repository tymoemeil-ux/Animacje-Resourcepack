vec4 tfxRenderScanline(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    float p = 0.5 + 0.5 * sin(gl_FragCoord.x * 0.10 - t * 8.0);
    return vec4(vec3(0.02, 0.78, 1.0) * (0.50 + 0.50 * p), a);
}
