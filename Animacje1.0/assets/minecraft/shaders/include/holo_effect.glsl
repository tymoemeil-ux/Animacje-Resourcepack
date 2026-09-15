void applyHoloEffect(vec2 uv, vec4 baseColor, vec4 effectColor, vec4 effectParams,
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
    float lines = max(effectParams.y, 4.0);
    float t = gameTime * speed;

    float rowPhase = fract(vNorm * lines);
    float row = step(0.45, rowPhase);
    float scan = 1.0 - smoothstep(0.0, 0.1, abs(vNorm - fract(t * 0.6)));
    float flicker = 0.82 + 0.18 * sin(t * 30.0) * (0.5 + 0.5 * sin(t * 7.3 + uNorm * 6.0));

    vec3 color = mix(baseColor.rgb, effectColor.rgb, 0.6);
    color *= mix(0.55, 1.0, row);
    color += effectColor.rgb * scan * 0.7;
    color *= flicker;

    float alphaF = mix(0.65, 1.0, row) * (0.85 + 0.15 * flicker);
    result = vec4(clamp(color, 0.0, 1.0), a * baseColor.a * alphaF);
}
