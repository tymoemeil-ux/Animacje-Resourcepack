vec4 tfxRenderIceCrystal(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    float p = 0.5 + 0.5 * sin(gl_FragCoord.x * 0.045 - t * 4.0);
    return vec4(vec3(0.45, 0.90, 1.0) * (0.72 + 0.28 * p), a);
}
