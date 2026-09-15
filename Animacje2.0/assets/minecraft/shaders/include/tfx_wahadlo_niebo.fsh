vec4 tfxRenderWahadloNiebo(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;

    float t = GameTime;
    float cl = 0.5 + 0.5 * sin(gl_FragCoord.x * 0.015 - t * 0.6 + sin(gl_FragCoord.y * 0.02 + t * 0.3) * 1.5);
    vec3 col = mix(vec3(0.2, 0.5, 1.0), vec3(0.9, 0.97, 1.0), cl * 0.6);
    return vec4(col, a);
}
