vec4 tfxRenderFalaWodna(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    float c = 0.5 + 0.5 * sin(tfxPos.x * 0.1 - t * 3.0);
    vec3 col = mix(vec3(0.0, 0.3, 0.35), vec3(0.1, 0.8, 0.75), c);
    return vec4(col, a);
}