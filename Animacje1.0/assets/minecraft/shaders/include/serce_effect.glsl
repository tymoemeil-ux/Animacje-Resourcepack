void applySerceEffect(vec2 uv, vec4 baseColor, vec4 effectColor, vec4 effectParams,
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
    float intensity = max(effectParams.y, 0.1);
    float t = gameTime * speed;
    float thump = pow(max(0.0, sin(t * 4.0)), 5.0) + 0.5 * pow(max(0.0, sin(t * 4.0 - 0.9)), 5.0);
    vec3 color = baseColor.rgb * (0.55 + 0.45 * thump) + vec3(1.0, 0.3, 0.4) * thump * 1.6 * intensity;
    result = vec4(clamp(color, 0.0, 1.0), a * baseColor.a * (0.8 + 0.2 * thump));
}
