vec4 tfxRenderTuszaNeon(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    float edge = pow(0.5 + 0.5 * sin(t * 3.0 + tfxPos.x * 0.08), 1.5);
    vec3 col = vec3(0.02, 0.02, 0.08) + vec3(0.6, 0.2, 1.0) * edge;
    return vec4(clamp(col, 0.0, 1.0), a);
}
