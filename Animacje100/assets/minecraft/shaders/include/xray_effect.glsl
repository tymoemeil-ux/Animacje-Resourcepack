void applyXrayEffect(vec2 uv, vec4 baseColor, vec4 effectColor, vec4 effectParams,
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
    float width = max(effectParams.y, 0.05);
    float t = gameTime * speed;

    float aL = texture(tex, uv - vec2(0.004, 0.0)).a;
    float aR = texture(tex, uv + vec2(0.004, 0.0)).a;
    float aD = texture(tex, uv - vec2(0.0, 0.004)).a;
    float aU = texture(tex, uv + vec2(0.0, 0.004)).a;
    float edge = (abs(aR - aL) + abs(aU - aD)) * 0.5;

    float scan = 1.0 - smoothstep(0.0, width, abs(vNorm - fract(t)));

    vec3 color = effectColor.rgb * (edge * 2.2 + scan * 0.8) + baseColor.rgb * a * 0.18;
    float alphaF = 0.3 + 0.7 * clamp(edge * 2.5 + scan * 0.6, 0.0, 1.0);
    result = vec4(clamp(color, 0.0, 1.0), a * baseColor.a * alphaF);
}
