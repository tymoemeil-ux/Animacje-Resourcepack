vec4 tfxRenderHeartbeatColor(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float ph = fract(GameTime * 1.2);
    float beat = pow(max(0.0, sin(ph * 6.283)), 3.0) + 0.6 * pow(max(0.0, sin(ph * 6.283 - 0.9)), 3.0);
    beat = min(beat, 1.0);
    vec3 col = vec3(0.55, 0.05, 0.08) + vec3(0.7, 0.1, 0.15) * beat;
    return vec4(col, a);
}
