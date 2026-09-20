vec4 tfxRenderHackBinary(vec2 uv, vec4 tex, vec4 base) {
    float a = tex.a;
    float t = GameTime;
    float p = step(0.5, fract(gl_FragCoord.x * 0.12 + t * 4.0));
    return vec4(vec3(0.0, 1.0, 0.52) * (0.46 + p * 0.54), a);
}
