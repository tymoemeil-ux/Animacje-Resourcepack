




#ifndef PI
#define PI 3.14159265359
#endif

void applyNeonEffect(vec2 uv,
                     vec4 effectColor,
                     vec4 effectParams,
                     vec3 glyphT0, vec3 glyphT1, vec3 glyphT2, vec3 glyphT3,
                     float gameTime,
                     sampler2D tex,
                     out vec4 result) {
    float currentA = texture(tex, uv).a;
    float intensity    = effectParams.x;
    float flickerSpeed = effectParams.y;

    vec2 uvMin, uvMax;
    calculateUVBounds(glyphT0, glyphT1, glyphT2, glyphT3, uvMin, uvMax);


    if (uvMax.x < uvMin.x || uvMax.y < uvMin.y) {
        uvMin = vec2(0.0);
        uvMax = vec2(1.0);
    }

    vec2 texSize = vec2(textureSize(tex, 0));


    float halo = 0.0;
    const int SAMPLES = 8;
    for (int i = 0; i < SAMPLES; i++) {
        float angle = float(i) * (PI / float(SAMPLES) * 2.0);
        for (float r = 1.0; r <= 3.0; r += 1.0) {
            vec2 offset = vec2(cos(angle), sin(angle)) * (r / texSize);
            vec2 sampleUV = uv + offset;
            if (sampleUV.x < uvMin.x || sampleUV.x > uvMax.x ||
                sampleUV.y < uvMin.y || sampleUV.y > uvMax.y) {
                continue;
            }
            halo += texture(tex, sampleUV).a / r;
        }
    }
    halo /= float(SAMPLES) * 3.0;
    halo *= intensity;


    float flicker = 1.0;
    if (flickerSpeed > 0.0001) {
        flicker = 0.85 + 0.15 * sin(gameTime * flickerSpeed * 5000.0)
                              * (0.5 + 0.5 * sin(gameTime * flickerSpeed * 10000.0 + 1.7));
    }

    vec3 neonColor = effectColor.rgb * flicker;

    if (currentA > 0.1) {

        result = vec4(neonColor, currentA * effectColor.a);
    } else if (halo > 0.05) {

        result = vec4(neonColor, halo * effectColor.a);
    } else {
        discard;
    }
}
