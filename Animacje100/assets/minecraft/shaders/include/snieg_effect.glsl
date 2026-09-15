void applySniegEffect(vec2 uv, vec4 baseColor, vec4 effectColor, vec4 effectParams,
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
    float flakes = max(effectParams.y, 2.0);
    vec2 g = vec2(uNorm, 1.0 - vNorm) * flakes;
    vec2 cell = floor(g);
    vec2 f = fract(g);
    float h2 = fract(sin(dot(vec2(cell.x, cell.y + 5.7), vec2(12.9898, 78.233))) * 43758.5453);
    float y = fract(gameTime * speed * (0.3 + h2 * 0.4) + h2 * 3.0);
    float x = 0.5 + (h2 - 0.5) * 0.8 + sin(gameTime * 1.5 + h2 * 10.0) * 0.1;
    float d = length(f - vec2(x, y)) * 3.0;
    float flake = 1.0 - smoothstep(0.15, 0.4, d);
    vec3 color = baseColor.rgb * (0.8 + flake * 0.3) + vec3(0.9, 0.95, 1.0) * flake * 1.3;
    result = vec4(clamp(color, 0.0, 1.0), a * baseColor.a);
}
