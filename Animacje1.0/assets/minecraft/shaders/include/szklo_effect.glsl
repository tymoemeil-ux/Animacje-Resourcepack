void applySzkloEffect(vec2 uv, vec4 baseColor, vec4 effectColor, vec4 effectParams,
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
    float width = max(effectParams.y, 0.03);
    float t = gameTime * speed;
    float pos = fract(t * 0.45);
    float diag = (uNorm + vNorm) * 0.5;
    float band = 1.0 - smoothstep(0.0, width, abs(diag - pos));
    float band2 = (1.0 - smoothstep(0.0, width * 3.0, abs(diag - pos))) * 0.3;
    vec3 color = mix(baseColor.rgb, vec3(0.92), 0.18);
    color += vec3(1.0) * (band * 1.15 + band2);
    color = mix(color, effectColor.rgb, 0.12);
    result = vec4(clamp(color, 0.0, 1.0), a * baseColor.a);
}
