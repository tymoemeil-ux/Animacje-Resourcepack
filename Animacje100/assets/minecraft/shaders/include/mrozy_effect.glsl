void applyMrozyEffect(vec2 uv, vec4 baseColor, vec4 effectColor, vec4 effectParams,
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
    float cells = max(effectParams.y, 3.0);
    float t = gameTime * speed;
    vec2 g = vec2(uNorm, 1.0 - vNorm) * cells;
    float l1 = abs(fract(g.x + g.y * 0.5 + t * 0.05) - 0.5);
    float l2 = abs(fract(g.x - g.y * 0.5 - t * 0.05) - 0.5);
    float l3 = abs(fract(g.y) - 0.5);
    float lattice = clamp((1.0 - smoothstep(0.0, 0.06, l1)) + (1.0 - smoothstep(0.0, 0.06, l2)) + (1.0 - smoothstep(0.0, 0.06, l3)), 0.0, 1.0);
    vec2 cell = floor(g);
    float seed = fract(sin(dot(cell, vec2(12.9898, 78.233))) * 43758.5453);
    float tw = step(0.85, seed) * (0.5 + 0.5 * sin(t * 4.0 + seed * 30.0));
    vec3 color = baseColor.rgb * 0.8 + effectColor.rgb * (lattice * 0.7 + tw);
    result = vec4(clamp(color, 0.0, 1.0), a * baseColor.a);
}
