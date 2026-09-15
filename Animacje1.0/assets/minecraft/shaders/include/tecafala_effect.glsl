void applyTecfalaEffect(vec2 uv, vec4 baseColor, vec4 effectColor, vec4 effectParams,
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
    float rows = max(effectParams.y, 1.0);
    float t = gameTime * speed;
    float v = fract((uNorm * 0.4 + vNorm * 0.2) * rows - t * 0.4);
    float r = clamp(abs(v * 6.0 - 3.0) - 1.0, 0.0, 1.0);
    float g = clamp(2.0 - abs(v * 6.0 - 2.0), 0.0, 1.0);
    float b = clamp(2.0 - abs(v * 6.0 - 4.0), 0.0, 1.0);
    vec3 color = mix(baseColor.rgb, vec3(r, g, b) * 1.15, 0.95);
    result = vec4(clamp(color, 0.0, 1.0), a * baseColor.a);
}
