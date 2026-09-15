void applyKrewEffect(vec2 uv, vec4 baseColor, vec4 effectColor, vec4 effectParams,
                      vec3 glyphT0, vec3 glyphT1, vec3 glyphT2, vec3 glyphT3,
                      float gameTime, sampler2D tex, out vec4 result) {
    float a = texture(tex, uv).a;
    if (a < 0.1) {
        discard;
    }

    vec2 uvMin, uvMax;
    calculateUVBounds(glyphT0, glyphT1, glyphT2, glyphT3, uvMin, uvMax);
    if (uvMax.x < uvMin.x || uvMax.y < uvMin.y) {
        uvMin = vec2(0.0);
        uvMax = vec2(1.0);
    }

    vec2 uvSize = uvMax - uvMin;
    float uNorm = (uvSize.x > 0.0001) ? (uv.x - uvMin.x) / uvSize.x : 0.5;
    float vNorm = (uvSize.y > 0.0001) ? (uv.y - uvMin.y) / uvSize.y : 0.5;

    float speed = max(effectParams.x, 0.1);
    float cols = max(effectParams.y, 3.0);
    float col = floor(uNorm * cols);
    float cs = fract(sin(col * 31.7 + 7.0) * 43758.5453);
    float head = fract(gameTime * speed * (0.25 + cs * 0.5) + col * 0.31);
    float d = fract((1.0 - vNorm) - head);
    float streak = exp(-d * 4.0) * (0.4 + 0.6 * cs);
    vec3 blood = vec3(0.45, 0.02, 0.05);
    vec3 color = mix(baseColor.rgb, blood, 0.85);
    color *= 0.55 + streak * 1.7;
    result = vec4(clamp(color, 0.0, 1.0), a * baseColor.a);
}
