
vec4 tfxRenderLaser2(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float b = fract(gl_FragCoord.y * 0.02 + GameTime * 0.45);
    float dd = min(b, 1.0 - b);
    float line = 1.0 - smoothstep(0.0, 0.05, dd);
    float glow = 1.0 - smoothstep(0.0, 0.22, dd);
    vec3 col = base.rgb * 0.45 + vec3(0.30, 0.95, 1.0) * (glow * 0.5 + line * 1.6);
    return vec4(clamp(col, 0.0, 1.0), a);
}
