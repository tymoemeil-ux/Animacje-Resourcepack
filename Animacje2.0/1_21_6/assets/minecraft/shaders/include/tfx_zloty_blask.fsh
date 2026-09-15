
vec4 tfxRenderZlotyBlask(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float d = gl_FragCoord.x * 0.007;
    float p = fract(d - GameTime * 0.8);
    float flash = 1.0 - smoothstep(0.0, 0.08, p);
    float shimmer = 0.60 + 0.40 * sin(d * 2.0 + GameTime * 3.0);
    vec3 col = vec3(0.95, 0.72, 0.20) * shimmer + vec3(1.0, 0.95, 0.75) * flash * 1.6;
    return vec4(clamp(col, 0.0, 1.0), a);
}
