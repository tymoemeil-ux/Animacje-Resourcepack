void applyMglawicaEffect(vec2 uv, vec4 baseColor, vec4 effectColor, vec4 effectParams,
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
    float drift = max(effectParams.y, 0.1);
    float t = gameTime * speed;
    float n1 = 0.5 + 0.5 * sin((uNorm * 4.0 + t * 0.5 * drift) * 1.5);
    float n2 = 0.5 + 0.5 * sin((vNorm * 5.0 - t * 0.4 * drift) * 1.7 + 2.0);
    float n = n1 * n2;
    vec3 c1 = vec3(0.45, 0.18, 0.65);
    vec3 c2 = vec3(0.1, 0.5, 0.75);
    vec3 c3 = vec3(0.75, 0.22, 0.55);
    vec3 color = mix(c1, c2, n);
    color = mix(color, c3, smoothstep(0.3, 0.8, n2));
    color *= 0.9 + 0.6 * n;
    vec2 g = vec2(uNorm, 1.0 - vNorm) * 10.0;
    vec2 cell = floor(g);
    vec2 f = fract(g);
    float h2 = fract(sin(dot(vec2(cell.x, cell.y + 3.1), vec2(12.9898, 78.233))) * 43758.5453);
    float star = step(0.9, h2) * (0.5 + 0.5 * sin(t * 3.0 + h2 * 25.0)) * (1.0 - smoothstep(0.0, 0.45, length(f - 0.5) * 2.0));
    color += vec3(1.0) * star * 1.3;
    result = vec4(clamp(color, 0.0, 1.0), a * baseColor.a);
}
