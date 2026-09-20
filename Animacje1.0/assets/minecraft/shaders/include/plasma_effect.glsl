void applyPlasmaEffect(vec2 uv, vec4 baseColor, vec4 effectColor, vec4 effectParams,
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
    float contrast = max(effectParams.y, 0.3);
    float t = gameTime * speed;
    float n = 0.5 + 0.5 * sin(uNorm * 5.0 + t);
    n += 0.5 + 0.5 * sin((1.0 - vNorm) * 4.0 - t * 1.3);
    n += 0.5 + 0.5 * sin((uNorm + vNorm) * 6.0 + t * 0.7);
    n = pow(n / 3.0, contrast);
    vec3 c1 = vec3(0.1, 0.2, 0.8);
    vec3 c2 = vec3(0.8, 0.1, 0.7);
    vec3 c3 = vec3(0.2, 0.9, 0.8);
    vec3 color = mix(c1, c2, smoothstep(0.2, 0.6, n));
    color = mix(color, c3, smoothstep(0.6, 0.95, n));
    result = vec4(color, a * baseColor.a);
}
