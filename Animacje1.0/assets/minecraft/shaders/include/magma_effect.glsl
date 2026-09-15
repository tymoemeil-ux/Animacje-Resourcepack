void applyMagmaEffect(vec2 uv, vec4 baseColor, vec4 effectColor, vec4 effectParams,
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
    float cracks = max(effectParams.y, 1.0);
    float t = gameTime * speed;
    float n1 = 0.5 + 0.5 * sin(uNorm * 8.0 * cracks + t * 0.7);
    float n2 = 0.5 + 0.5 * sin((uNorm + vNorm) * 11.0 * cracks - t * 1.1 + 2.0);
    float crack = 1.0 - smoothstep(0.0, 0.25, abs(n1 - n2));
    vec2 cellF = floor(vec2(uNorm, 1.0 - vNorm) * 6.0) + vec2(floor(t), 0.0);
    float bubble = step(0.9, fract(sin(dot(cellF, vec2(12.9898, 78.233))) * 43758.5453));
    vec3 rock = vec3(0.12, 0.05, 0.03);
    vec3 glow = vec3(1.0, 0.45, 0.05);
    vec3 color = rock + glow * (crack * (0.8 + 0.3 * sin(t * 3.0)) + bubble * 0.6);
    result = vec4(color, a * baseColor.a);
}
