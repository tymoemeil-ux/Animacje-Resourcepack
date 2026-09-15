void applySwiatloEffect(vec2 uv, vec4 baseColor, vec4 effectColor, vec4 effectParams,
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
    float radius = max(effectParams.y, 0.1);
    float t = gameTime * speed;
    float pulse = 0.5 + 0.5 * sin(t * 2.5);
    vec2 p = vec2(uNorm, vNorm) - 0.5;
    float d = length(p) * 2.2 / radius;
    float orb = (1.0 - smoothstep(0.0, 0.7, d)) * (0.5 + 0.5 * pulse);
    vec3 color = baseColor.rgb * (0.6 + orb * 0.5) + vec3(1.0, 0.95, 0.8) * orb * 1.3;
    result = vec4(clamp(color, 0.0, 1.0), a * baseColor.a);
}
