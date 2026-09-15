void applyRadioaktywnyEffect(vec2 uv, vec4 baseColor, vec4 effectColor, vec4 effectParams,
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
    float intensity = max(effectParams.y, 0.1);
    float t = gameTime * speed;
    float pulse = 0.6 + 0.4 * sin(t * 2.5);
    vec2 cellF = vec2(floor(uNorm * 16.0), floor(vNorm * 16.0) + floor(t * 10.0));
    float staticN = fract(sin(dot(cellF, vec2(12.9898, 78.233))) * 43758.5453);
    vec3 toxic = vec3(0.4, 1.0, 0.2);
    vec3 color = mix(baseColor.rgb, toxic, 0.45) * (0.7 + 0.5 * pulse) + toxic * staticN * 0.3 * pulse * intensity;
    result = vec4(clamp(color, 0.0, 1.0), a * baseColor.a);
}
