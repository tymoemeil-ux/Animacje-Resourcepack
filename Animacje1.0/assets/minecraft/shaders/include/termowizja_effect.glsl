void applyTermowizjaEffect(vec2 uv, vec4 baseColor, vec4 effectColor, vec4 effectParams,
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

    float n1 = 0.5 + 0.5 * sin((uNorm * 7.0 + t * 1.3) * 1.1);
    float n2 = 0.5 + 0.5 * sin((vNorm * 6.0 - t * 1.7) * 1.3);
    float n3 = 0.5 + 0.5 * sin((uNorm + vNorm) * 9.0 + t * 2.1);
    float n = n1 * n2 * 2.0 * 0.6 + n3 * 0.4;
    n = clamp((n - 0.5) * contrast + 0.5, 0.0, 1.0);

    vec3 c1 = vec3(0.05, 0.0, 0.45);
    vec3 c2 = vec3(0.55, 0.0, 0.7);
    vec3 c3 = vec3(0.95, 0.35, 0.05);
    vec3 c4 = vec3(1.0, 1.0, 0.15);
    vec3 color = mix(c1, c2, smoothstep(0.0, 0.35, n));
    color = mix(color, c3, smoothstep(0.35, 0.7, n));
    color = mix(color, c4, smoothstep(0.7, 1.0, n));

    result = vec4(color, a * baseColor.a);
}
