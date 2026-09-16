vec4 tfxRenderMorska(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    float c = 0.5 + 0.5 * sin(tfxPos.x * 0.06 - t * 1.8);
    vec3 col = mix(vec3(0.02, 0.12, 0.35), vec3(0.1, 0.5, 0.8), c);
    return vec4(col, a);
}
