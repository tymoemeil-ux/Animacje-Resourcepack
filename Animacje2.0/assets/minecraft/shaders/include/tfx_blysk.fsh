vec4 tfxRenderBlysk(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float d = gl_FragCoord.x * 0.006;
    float t = GameTime;
    float p  = fract(d - t * 1.1);
    float p2 = fract(d * 0.6 + 0.37 - t * 1.7);
    float flash  = 1.0 - smoothstep(0.0, 0.05, p);
    float flash2 = 1.0 - smoothstep(0.0, 0.09, p2);
    float tail   = (1.0 - smoothstep(0.0, 0.50, p)) * 0.35;
    vec3 col = base.rgb * (0.55 + 0.50 * tail) + vec3(0.85, 0.93, 1.0) * (flash * 2.0 + flash2 * 0.9);
    return vec4(clamp(col, 0.0, 1.0), a);
}
