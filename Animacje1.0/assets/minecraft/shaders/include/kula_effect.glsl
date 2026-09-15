void applyKulaEffect(vec2 uv, vec4 baseColor, vec4 effectColor, vec4 effectParams,
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
    float ang = t * 3.0;
    vec2 cpos = vec2(0.5 + cos(ang) * 0.3 * radius, 0.5 + sin(ang * 0.8) * 0.25 * radius);
    vec2 cpos2 = vec2(0.5 + cos(ang * 0.7 + 3.0) * 0.35 * radius, 0.5 + sin(ang + 2.0) * 0.3 * radius);
    vec2 p = vec2(uNorm, 1.0 - vNorm);
    float d = length(p - cpos) * 2.2;
    float d2 = length(p - cpos2) * 2.5;
    float orb = 1.0 - smoothstep(0.0, 0.8, d);
    float orb2 = (1.0 - smoothstep(0.0, 1.4, d)) * 0.5 + (1.0 - smoothstep(0.0, 1.0, d2)) * 0.5;
    vec3 fire = mix(vec3(1.0, 0.3, 0.0), vec3(1.0, 0.9, 0.35), orb);
    vec3 color = baseColor.rgb * (0.6 + orb2) + fire * (orb * 1.6 + orb2 * 0.8);
    result = vec4(clamp(color, 0.0, 1.0), a * baseColor.a);
}
