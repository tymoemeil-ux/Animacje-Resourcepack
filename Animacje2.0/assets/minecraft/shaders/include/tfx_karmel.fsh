vec4 tfxRenderKarmel(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;

    float t = GameTime;
    float p = 0.5 + 0.5 * sin(t * 2.2);
    vec3 col = mix(vec3(0.75, 0.45, 0.15), vec3(1.0, 0.72, 0.3), p);
    return vec4(col, a);
}
