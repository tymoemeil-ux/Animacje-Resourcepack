vec4 tfxRenderGrafit(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;

    float t = GameTime;
    float sh = 0.5 + 0.5 * sin(tfxPos.x * 0.06 - t * 1.8 + sin(gl_FragCoord.y * 0.05 + t));
    vec3 col = mix(vec3(0.25, 0.27, 0.3), vec3(0.7, 0.75, 0.8), sh * 0.8);
    return vec4(col, a);
}
