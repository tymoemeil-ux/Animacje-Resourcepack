void applyIskreniceEffect(vec2 uv, vec4 baseColor, vec4 effectColor, vec4 effectParams,
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
    float density = max(effectParams.y, 2.0);
    vec2 g = vec2(uNorm, 1.0 - vNorm) * density;
    vec2 cell = floor(g);
    vec2 f = fract(g);
    float tStep = floor(gameTime * speed * 8.0);
    float h2 = fract(sin(dot(vec2(cell.x * 23.17 + tStep, cell.y * 7.0 + tStep), vec2(12.9898, 78.233))) * 43758.5453);
    float on = step(0.45, h2);
    float tw = sin(fract(h2 * 17.0 + gameTime * speed * 3.0) * 3.14159 * 2.0) * 0.5 + 0.5;
    float star = (1.0 - smoothstep(0.0, 0.55, length(f - 0.5) * 2.0)) * (0.6 + 0.4 * tw);
    vec3 gold = mix(vec3(1.0, 0.85, 0.4), vec3(1.0, 1.0, 0.8), h2);
    vec3 color = baseColor.rgb * 0.85 + gold * star * on * 2.2;
    result = vec4(clamp(color, 0.0, 1.0), a * baseColor.a);
}
