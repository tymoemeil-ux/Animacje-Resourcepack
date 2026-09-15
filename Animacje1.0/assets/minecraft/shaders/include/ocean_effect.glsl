void applyOceanEffect(vec2 uv, vec4 baseColor, vec4 effectColor, vec4 effectParams,
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
    float waves = max(effectParams.y, 1.0);
    float t = gameTime * speed;
    float level = 0.55 + 0.08 * sin(t * 1.2) * waves;
    float filled = step(vNorm, level);
    float crest = 1.0 - smoothstep(0.0, 0.06, abs(vNorm - level));
    float foam = step(0.8, fract(vNorm * 8.0 + t * 0.8)) * filled * 0.45;
    vec3 deep = effectColor.rgb * 0.6;
    vec3 color = mix(baseColor.rgb * 0.55, deep, filled);
    color += vec3(1.0) * (crest * 0.85 + foam);
    result = vec4(clamp(color, 0.0, 1.0), a * baseColor.a);
}
