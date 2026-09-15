void applyLaser2Effect(vec2 uv, vec4 baseColor, vec4 effectColor, vec4 effectParams,
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
    float width = max(effectParams.y, 0.04);
    float t = gameTime * speed;
    float p1 = fract(0.6 * uNorm + 0.4 * vNorm - t * 0.7);
    float p2 = fract(0.6 * uNorm + 0.4 * (1.0 - vNorm) - (1.0 - t * 0.5));
    float l1 = min((1.0 - smoothstep(0.0, width * 1.5, p1)) + (1.0 - smoothstep(0.0, width * 1.5, p2)), 1.5);
    vec3 color = baseColor.rgb * 0.45 + vec3(0.9, 0.4, 1.0) * l1 * 1.7;
    result = vec4(clamp(color, 0.0, 1.0), a * baseColor.a);
}
