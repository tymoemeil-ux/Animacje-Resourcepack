vec4 tfxRenderSzklo(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    float scan = 0.5 + 0.5 * sin(gl_FragCoord.x * 0.030 - t * 3.0);
    float glint = pow(max(scan, 0.0), 8.0);
    vec3 col = vec3(0.34, 0.86, 1.0) * (0.68 + 0.20 * scan) + vec3(0.85, 0.98, 1.0) * glint;
    return vec4(clamp(col, 0.0, 1.0), a);
}
