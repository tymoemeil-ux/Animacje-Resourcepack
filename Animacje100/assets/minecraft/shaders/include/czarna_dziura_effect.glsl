void applyCzarnaDziuraEffect(vec2 uv, vec4 baseColor, vec4 effectColor, vec4 effectParams,
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
    float strength = max(effectParams.y, 0.1);
    vec2 p = vec2(uNorm, 1.0 - vNorm) - 0.5;
    float ang = atan(p.y, p.x);
    float rad = length(p);
    float t = gameTime * speed;
    float spiral = sin(ang * 3.0 + rad * 12.0 - t * 3.0);
    vec2 pull = p * (0.15 * (1.0 - rad) * strength);
    float aO = texture(tex, uv + pull).a;
    vec3 color = mix(baseColor.rgb, effectColor.rgb, 0.3 + 0.4 * max(0.0, spiral));
    float core = 1.0 - smoothstep(0.0, 0.25, rad);
    color *= 1.0 - core * 0.85;
    result = vec4(clamp(color, 0.0, 1.0), aO * baseColor.a);
}
