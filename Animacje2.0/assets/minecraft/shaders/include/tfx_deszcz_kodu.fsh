vec4 tfxRenderDeszczKodu(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;

    float t = GameTime;
    float x = tfxHashF(vec2(floor(tfxPos.x * 0.2), 9.0));
    float f = fract(gl_FragCoord.y * 0.012 - t * (2.0 + x * 3.0) + x * 4.0);
    float streak = smoothstep(0.3, 0.9, f) * (1.0 - smoothstep(0.9, 1.0, f));
    vec3 col = vec3(0.1, 1.0, 0.4) * (0.25 + 0.75 * streak);
    return vec4(col, a);
}
