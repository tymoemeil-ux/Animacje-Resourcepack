void applyDymEffect(vec2 uv, vec4 baseColor, vec4 effectColor, vec4 effectParams,
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
    float n = 0.5 + 0.5 * sin((uNorm * 6.0 + t * 0.5) * 2.0 + sin((1.0 - vNorm) * 8.0 + t * 1.2) * 1.5);
    float n2 = 0.5 + 0.5 * sin((uNorm * 11.0 - t * 0.8) * 2.0 + 3.0);
    float smoke = n * n2;
    float rise = smoothstep(0.0, 1.0, vNorm);
    vec3 color = mix(baseColor.rgb, vec3(0.62), 0.5) * (0.5 + 0.85 * smoke);
    float alphaF = mix(1.0, 0.65 + 0.35 * smoke, 0.4 + 0.3 * drift) * (1.0 - rise * 0.35);
    result = vec4(clamp(color, 0.0, 1.0), a * baseColor.a * alphaF);
}
