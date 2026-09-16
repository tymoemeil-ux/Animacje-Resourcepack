vec4 tfxRenderFalowanieGoraGalaktyczny(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    float n1 = tfxHashF(gl_FragCoord.xy * 0.15);
    float star = pow(n1, 8.0) * (0.5 + 0.5 * sin(t * 2.0 + n1 * 50.0));
    vec3 col = vec3(0.15, 0.1, 0.4) * (0.7 + 0.3 * sin(t * 1.5 + tfxPos.x * 0.04));
    col += vec3(0.9, 0.8, 1.0) * star;
    col += vec3(0.3, 0.1, 0.4) * (0.3 + 0.3 * sin(tfxPos.x * 0.03 - t * 0.3));
    return vec4(clamp(col, 0.0, 1.0), a);
}
