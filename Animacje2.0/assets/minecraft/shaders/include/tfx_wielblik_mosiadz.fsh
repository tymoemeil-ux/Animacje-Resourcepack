vec4 tfxRenderWielblikMosiadz(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;

    float t = GameTime;
    float l = 0.5 + 0.5 * sin(t * 1.6 + tfxPos.x * 0.05);
    vec3 col = mix(vec3(0.55, 0.38, 0.15), vec3(1.0, 0.8, 0.4), l * 0.7);
    return vec4(col, a);
}
