void applyGwiazdyEffect(vec2 uv, vec4 baseColor, vec4 effectColor, vec4 effectParams,
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
    float stars = max(effectParams.y, 4.0);
    float t = gameTime * speed;
    vec2 g = vec2(uNorm + t * 0.08, 1.0 - vNorm) * stars;
    vec2 cell = floor(g);
    vec2 f = fract(g);
    float h2 = fract(sin(dot(vec2(cell.x, cell.y + 17.3), vec2(12.9898, 78.233))) * 43758.5453);
    float tw = 0.5 + 0.5 * sin(t * 3.5 + h2 * 30.0);
    float star = step(0.6, h2) * tw * (1.0 - smoothstep(0.0, 0.45, length(f - 0.5) * 2.0));
    vec3 color = baseColor.rgb * 0.65 + vec3(0.9, 0.95, 1.0) * star * 2.0;
    result = vec4(clamp(color, 0.0, 1.0), a * baseColor.a);
}
