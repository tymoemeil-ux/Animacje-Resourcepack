void applyPulsarEffect(vec2 uv, vec4 baseColor, vec4 effectColor, vec4 effectParams,
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
    float rings = max(effectParams.y, 1.0);
    vec2 p = vec2(uNorm, vNorm) - 0.5;
    float rad = length(p) * 2.0;
    float t = gameTime * speed;
    float ring = fract(t * 0.5);
    float d = abs(fract(rad * rings - ring) - 0.5);
    float glow = 1.0 - smoothstep(0.0, 0.15, d);
    vec3 color = baseColor.rgb * (1.0 - glow * 0.4) + effectColor.rgb * glow * 1.25;
    result = vec4(clamp(color, 0.0, 1.0), a * baseColor.a);
}
