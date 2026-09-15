
vec4 tfxRenderObrys(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float n = 0.0;
    n = max(n, texture(Sampler0, uv + vec2( 1.0 / 128.0, 0.0)).a);
    n = max(n, texture(Sampler0, uv + vec2(-1.0 / 128.0, 0.0)).a);
    n = max(n, texture(Sampler0, uv + vec2(0.0,  1.0 / 128.0)).a);
    n = max(n, texture(Sampler0, uv + vec2(0.0, -1.0 / 128.0)).a);
    float edge = n - a;
    float pulse = 0.75 + 0.25 * sin(GameTime * 4.0);
    vec3 col = base.rgb * 0.25 + vec3(1.0, 0.45, 0.10) * edge * 2.2 * pulse + base.rgb * a * 0.15;
    return vec4(clamp(col, 0.0, 1.0), max(a, edge * 0.9));
}
