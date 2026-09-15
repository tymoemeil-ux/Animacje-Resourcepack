void applyKolumnaEffect(vec2 uv, vec4 baseColor, vec4 effectColor, vec4 effectParams,
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
    float columns = max(effectParams.y, 1.0);
    float t = gameTime * speed;
    float col = floor(uNorm * columns);
    float seed = fract(sin(col * 7.31) * 43758.5453);
    float y = fract((1.0 - vNorm) + t * (0.4 + seed * 0.3) + seed * 2.0);
    float band = (1.0 - smoothstep(0.0, 0.15, y)) * step(0.3, seed);
    float glow = exp(-y * 3.0) * 0.3 * step(0.3, seed);
    vec3 color = baseColor.rgb * 0.7 + vec3(0.6, 0.9, 1.0) * (band * 1.3 + glow);
    result = vec4(clamp(color, 0.0, 1.0), a * baseColor.a);
}
