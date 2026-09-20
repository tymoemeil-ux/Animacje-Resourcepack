vec4 tfxRenderElectric(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    float p = pow(max(0.0, sin(t * 14.0 + gl_FragCoord.x * 0.09)), 8.0);
    return vec4(mix(vec3(0.08, 0.35, 1.0), vec3(0.82, 0.96, 1.0), p), a);
}
