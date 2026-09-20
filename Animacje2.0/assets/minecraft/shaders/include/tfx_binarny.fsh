vec4 tfxRenderBinarny(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;

    float t = GameTime;
    float bit = step(0.5, fract(t * 3.0 + tfxPos.x * 0.25));
    vec3 col = mix(vec3(0.05, 0.3, 0.1), vec3(0.2, 1.0, 0.45), bit);
    return vec4(col, a);
}
