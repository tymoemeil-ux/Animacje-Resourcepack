void applyPortalEffect(vec2 uv, vec4 baseColor, vec4 effectColor, vec4 effectParams,
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
    float swirls = max(effectParams.y, 1.0);
    float t = gameTime * speed;

    vec2 p = vec2(uNorm, 1.0 - vNorm) - 0.5;
    float ang = atan(p.y, p.x);
    float rad = length(p) * 2.0;

    float v1 = 0.5 + 0.5 * sin(ang * swirls + rad * 9.0 - t * 3.0);
    float v2 = 0.5 + 0.5 * sin(ang * 3.0 - rad * 6.0 + t * 2.2);

    vec3 c1 = vec3(0.5, 0.15, 0.75);
    vec3 c2 = vec3(0.95, 0.4, 1.0);
    vec3 c3 = vec3(0.2, 0.5, 0.95);
    vec3 color = mix(c1, c2, v1);
    color = mix(color, c3, v2 * 0.6);

    float center = 1.0 - smoothstep(0.0, 1.0, rad);
    color *= 0.65 + 0.5 * center;
    color += effectColor.rgb * center * 0.5;

    result = vec4(clamp(color, 0.0, 1.0), a * baseColor.a);
}
