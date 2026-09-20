vec4 tfxRenderCyber(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;

    float t = GameTime;
    float p = 0.5 + 0.5 * sin(t * 2.5 + tfxPos.x * 0.1);
    vec3 col = mix(vec3(0.0, 0.9, 0.5), vec3(0.1, 0.95, 1.0), p);
    col *= 0.7 + 0.3 * (0.5 + 0.5 * sin(t * 7.0));
    return vec4(col, a);
}
