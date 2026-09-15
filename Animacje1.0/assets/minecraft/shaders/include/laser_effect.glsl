void applyLaserEffect(vec2 uv, vec4 baseColor, vec4 effectColor, vec4 effectParams,
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
    float width = max(effectParams.y, 0.02);
    float t = gameTime * speed;

    float scan = fract(t);
    float band = abs(vNorm - scan);
    float line = 1.0 - smoothstep(0.0, width, band);
    float glow = (1.0 - smoothstep(0.0, width * 5.0, band)) * 0.35;

    float scan2 = fract(t * 0.73 + 0.31);
    float band2 = abs(uNorm - scan2);
    float line2 = (1.0 - smoothstep(0.0, width * 1.5, band2)) * 0.5;

    vec3 color = baseColor.rgb + effectColor.rgb * (line * 1.3 + glow + line2);
    color += effectColor.rgb * 0.1;

    result = vec4(clamp(color, 0.0, 1.0), a * baseColor.a);
}
