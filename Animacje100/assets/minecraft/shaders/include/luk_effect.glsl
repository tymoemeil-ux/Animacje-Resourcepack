void applyLukEffect(vec2 uv, vec4 baseColor, vec4 effectColor, vec4 effectParams,
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
    float arcs = max(effectParams.y, 1.0);
    float t = gameTime * speed;
    float stepF = floor(t * 10.0);
    float col = floor(uNorm * 14.0);
    float seed = fract(sin(col * 5.1 + stepF * 13.7) * 43758.5453);
    float lineY = 0.5 + (seed - 0.5) * 0.6;
    float d = abs((1.0 - vNorm) - lineY);
    float arc = (1.0 - smoothstep(0.0, 0.05 + 0.03 * arcs, d)) * step(0.4, seed);
    vec3 color = baseColor.rgb * 0.8 + vec3(0.5, 0.9, 1.0) * arc * 1.6;
    result = vec4(clamp(color, 0.0, 1.0), a * baseColor.a * (0.9 + 0.1 * arc));
}
