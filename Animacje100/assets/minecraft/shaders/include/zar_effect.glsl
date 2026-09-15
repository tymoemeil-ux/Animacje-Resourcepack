void applyZarEffect(vec2 uv, vec4 baseColor, vec4 effectColor, vec4 effectParams,
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
    float embers = max(effectParams.y, 2.0);
    vec2 g = vec2(uNorm, 1.0 - vNorm) * embers;
    vec2 cell = floor(g);
    vec2 f = fract(g);
    float h2 = fract(sin(dot(vec2(cell.x, cell.y + 9.3), vec2(12.9898, 78.233))) * 43758.5453);
    float y = fract(gameTime * speed * (0.15 + h2 * 0.3) + h2);
    float x = 0.5 + (h2 - 0.5) * 0.7 + sin(gameTime * 3.0 + h2 * 20.0) * 0.08;
    float d = length(f - vec2(x, y)) * 4.0;
    float ember = (1.0 - smoothstep(0.1, 0.35, d)) * (0.4 + 0.6 * y);
    vec3 col = mix(vec3(0.9, 0.3, 0.05), vec3(1.0, 0.75, 0.2), y);
    vec3 color = baseColor.rgb * 0.75 + col * ember * 1.5;
    result = vec4(clamp(color, 0.0, 1.0), a * baseColor.a);
}
