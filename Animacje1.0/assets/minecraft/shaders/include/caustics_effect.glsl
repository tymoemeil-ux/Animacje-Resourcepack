void applyCausticsEffect(vec2 uv, vec4 baseColor, vec4 effectColor, vec4 effectParams,
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
    float scale = max(effectParams.y, 2.0);
    float t = gameTime * speed;

    float c1 = 0.5 + 0.5 * sin((uNorm + vNorm * 0.7) * scale * 1.7 + t * 1.3);
    float c2 = 0.5 + 0.5 * sin((uNorm * 1.3 - vNorm) * scale * 2.1 - t * 1.9);
    float c3 = 0.5 + 0.5 * sin((uNorm * 0.6 + vNorm) * scale * 2.6 + t * 2.3);
    float c = (c1 * c2 * 2.0 + c3) / 3.0;
    float web = pow(c, 2.0) * 1.6;

    vec3 color = baseColor.rgb * (0.75 + 0.45 * web) + effectColor.rgb * web * 0.55;
    result = vec4(clamp(color, 0.0, 1.0), a * baseColor.a);
}
