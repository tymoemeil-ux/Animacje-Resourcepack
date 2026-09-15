vec4 tfxRenderSrebro(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;

    float t = GameTime;
    float glint = 0.5 + 0.5 * sin(tfxPos.x * 0.045 - t * 2.2);
    vec3 col = mix(vec3(0.55, 0.58, 0.63), vec3(1.0, 1.0, 1.0), glint);
    return vec4(col, a);
}
