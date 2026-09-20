void applyKrysztalEffect(vec2 uv, vec4 baseColor, vec4 effectColor, vec4 effectParams,
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
    float cells = max(effectParams.y, 2.0);
    float t = gameTime * speed;

    vec2 g = vec2(uNorm, 1.0 - vNorm) * cells;
    vec2 cell = floor(g);
    vec2 f = fract(g);

    float h1 = fract(sin(dot(cell, vec2(12.9898, 78.233))) * 43758.5453);
    float h2 = fract(sin(dot(cell + 7.31, vec2(12.9898, 78.233))) * 43758.5453);
    vec2 c = vec2(h1, h2);

    float d = length(f - c);
    float facet = 1.0 - smoothstep(0.0, 1.1, d);

    float shine = fract(t * 0.4 + h1 * 13.0);
    float spec = 1.0 - smoothstep(0.0, 0.12, abs(facet * 0.9 - shine));

    vec3 color = mix(baseColor.rgb, effectColor.rgb, 0.25);
    color += effectColor.rgb * (facet * 0.35 + spec * 1.1);
    result = vec4(clamp(color, 0.0, 1.0), a * baseColor.a);
}
