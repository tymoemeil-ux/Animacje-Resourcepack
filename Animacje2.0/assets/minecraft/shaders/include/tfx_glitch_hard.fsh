vec4 tfxRenderGlitchHardColor(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float f = floor(GameTime * 20.0);
    float n = tfxHashF(vec2(f, gl_FragCoord.x * 0.02));
    vec3 col = base.rgb;
    col.r *= 1.0 + 0.5 * n;
    col.b *= 1.0 + 0.5 * (1.0 - n);
    col += (n > 0.97) ? vec3(0.6) : vec3(0.0);
    return vec4(clamp(col, 0.0, 1.0), a);
}
