void applyZlotyBlaskEffect(vec2 uv, vec4 baseColor, vec4 effectColor, vec4 effectParams,
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
    float width = max(effectParams.y, 0.05);
    float t = gameTime * speed;
    float d = 0.7 * uNorm + 0.3 * vNorm;
    float p = fract(d - t * 0.45);
    float p2 = fract(d + 0.5 - t * 0.3);
    float glow = (1.0 - smoothstep(0.0, width * 1.8, p));
    float glow2 = (1.0 - smoothstep(0.0, width * 2.5, p2));
    vec3 gold = vec3(1.0, 0.8, 0.3);
    vec3 gold2 = vec3(1.0, 0.96, 0.72);
    vec3 color = baseColor.rgb * 0.6 + mix(gold, gold2, glow) * (0.45 + glow * 1.8 + glow2 * 0.9);
    result = vec4(clamp(color, 0.0, 1.0), a * baseColor.a);
}
