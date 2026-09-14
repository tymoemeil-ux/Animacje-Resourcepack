void applyEffect(inout vec4 vertex, vec4 baseColor, bool isShadow) {
    vec4 displayColor = isShadow ? vec4(baseColor.rgb * 0.25, baseColor.a) : baseColor;

    bool suppressFragmentShadow = isShadow && (
        flagOutline || flagHatch || flagNeon || flagChromatic ||
        flagExtrude || flagNoise || flagLiquid || flagWater
    );
    if (suppressFragmentShadow) {
        gl_Position = vec4(2.0, 2.0, 2.0, 1.0);
        vertexColor = vec4(0.0);
        fshEffectID = 0.0;
        finalize();
        return;
    }




    if (flagBlinking) {
        float blink = step(0.5, fract(GameTime * paramBlinkSpeed * 1200.0));
        if (blink < 0.5) {
            gl_Position = vec4(2.0, 2.0, 2.0, 1.0);
            finalize();
            return;
        }
    }




    if (flagShake) {
        float charId = floor(float(gl_VertexID) / 4.0);
        float shakeTime = GameTime * 32000.0 * paramShakeSpeed;
        float noiseX = noise(charId * 10.0 + shakeTime) - 0.5;
        float noiseY = noise(charId * 10.0 - shakeTime + 100.0) - 0.5;
        setOffset(noiseX * paramShakeIntensity, noiseY * paramShakeIntensity);
        applyOffset(vertex);
    }

    if (flagBouncy) {
        float vertexId = mod(float(gl_VertexID), 4.0);
        float bounceTime = GameTime * paramBounceSpeed;
        if (vertexId == 3.0 || vertexId == 0.0) {
            setOffset(0.0, cos(bounceTime) * paramBounceAmplitude + max(cos(bounceTime) * paramBounceAmplitude, 0.0));
            applyOffset(vertex);
        }
    }

    if (flagPulse) {
        float pulseTime = GameTime * paramPulseSpeed * 1000.0;
        float pulseFactor = (sin(pulseTime) * 0.5 + 0.5);
        float expansion = paramPulseSize * 2.5 * pulseFactor;
        float vertexId = mod(float(gl_VertexID), 4.0);
        vec2 pulseDir = vec2(0.0);
        if (vertexId < 0.5) pulseDir = vec2(-1.0, -1.0);
        else if (vertexId < 1.5) pulseDir = vec2(-1.0, 1.0);
        else if (vertexId < 2.5) pulseDir = vec2(1.0, 1.0);
        else pulseDir = vec2(1.0, -1.0);
        pulseDir *= vec2(0.7, 1.0);
        vec2 pulseOffset = pulseDir * expansion;
        setOffset(pulseOffset.x, pulseOffset.y);
        applyOffset(vertex);
    }

    if (flagIterating) {
        float iterSpeed = paramIteratingSpeed;
        float iterSpace = paramIteratingSpace;
        if (iterSpeed <= 0.0) iterSpeed = 1.0;
        if (iterSpace <= 0.0) iterSpace = 1.0;





        float charId = (ProjMat[3][3] != 0.0)
            ? floor(Position.x / 6.0)
            : floor(float(gl_VertexID) / 4.0);
        float iterTime = GameTime * 18000.0 * iterSpeed;
        float iterX = mod(charId * 0.4 - iterTime, (5.0 * iterSpace) * TAU);
        if (iterX > TAU) iterX = TAU;

        setOffset(0.0, (-cos(iterX) * 0.5 + 0.5) * -2.0);
        applyOffset(vertex);
    }

    if (flagGlitch) {
        float gSpeed = paramGlitchSpeed;
        float gIntensity = paramGlitchIntensity;
        if (gSpeed <= 0.0) gSpeed = 1.0;
        if (gIntensity <= 0.0) gIntensity = 2.0;
        float glitchTime = floor(GameTime * 32000.0 * gSpeed);
        float glitchCharId = floor(float(gl_VertexID) / 4.0);
        float glitchTrigger = random(vec2(glitchTime * 0.1, 0.0));
        float glitchOffX = 0.0;
        float glitchOffY = 0.0;
        if (glitchTrigger > 0.7) {
            glitchOffX = (random(vec2(glitchCharId + glitchTime, 1.0)) - 0.5) * gIntensity * 4.0;
        }
        if (glitchTrigger > 0.85) {
            glitchOffY = (random(vec2(glitchCharId - glitchTime + 50.0, 2.0)) - 0.5) * gIntensity;
        }
        setOffset(glitchOffX, glitchOffY);
        applyOffset(vertex);
    }

    if (flagScale) {
        float scaleVid = mod(float(gl_VertexID), 4.0);
        vec2 scaleDir;
        if      (scaleVid < 0.5) scaleDir = vec2(-1.0, -1.0);
        else if (scaleVid < 1.5) scaleDir = vec2(-1.0,  1.0);
        else if (scaleVid < 2.5) scaleDir = vec2( 1.0,  1.0);
        else                     scaleDir = vec2( 1.0, -1.0);
        float actualExpansion = (paramScaleFactor - 1.0) * 4.0;
        scaleDir *= vec2(0.7, 1.0);
        vec2 scaleOffset = scaleDir * actualExpansion + vec2(paramScaleOffsetX, paramScaleOffsetY);
        setOffset(scaleOffset.x, scaleOffset.y);
        applyOffset(vertex);
    }

    if (flagOutline) {
        float vid = mod(float(gl_VertexID), 4.0);
        vec2 outDir;
        if      (vid < 0.5) outDir = vec2(-1.0, -1.0);
        else if (vid < 1.5) outDir = vec2(-1.0,  1.0);
        else if (vid < 2.5) outDir = vec2( 1.0,  1.0);
        else                outDir = vec2( 1.0, -1.0);
        float pad = paramOutlineThickness + 1.0;
        setOffset(outDir.x * pad, outDir.y * pad);
        applyOffset(vertex);


        texCoord0 += outDir * (pad / 256.0);
    }

    if (flagSplit) {




        float fracVid = mod(float(gl_VertexID), 4.0);
        if (fracVid == 0.0 || fracVid == 1.0) {
            setOffset(-paramSplitIntensity * 1.6, 0.0);
            applyOffset(vertex);
        }
    }

    if (flagChromatic) {


        float vid = mod(float(gl_VertexID), 4.0);
        float dx = (vid == 0.0 || vid == 1.0) ? -1.0 : 1.0;
        float pad = paramChromaticIntensity * 1.5;
        setOffset(dx * pad, 0.0);
        applyOffset(vertex);
        texCoord0.x += dx * pad / 256.0;
    }

    if (flagExtrude) {

        float vid = mod(float(gl_VertexID), 4.0);
        bool isRight  = (vid == 2.0 || vid == 3.0);
        bool isBottom = (vid == 1.0 || vid == 2.0);
        float pad = paramExtrudeDepth * paramExtrudeLayers + 1.0;
        setOffset(isRight ? pad : 0.0, isBottom ? pad : 0.0);
        applyOffset(vertex);
        texCoord0 += vec2(isRight ? pad / 256.0 : 0.0, isBottom ? pad / 256.0 : 0.0);
    }

    if (flagNoise) {

        float vid = mod(float(gl_VertexID), 4.0);
        vec2 outDir;
        if      (vid < 0.5) outDir = vec2(-1.0, -1.0);
        else if (vid < 1.5) outDir = vec2(-1.0,  1.0);
        else if (vid < 2.5) outDir = vec2( 1.0,  1.0);
        else                outDir = vec2( 1.0, -1.0);
        float pad = paramNoiseIntensity + 1.0;
        setOffset(outDir.x * pad, outDir.y * pad);
        applyOffset(vertex);
        texCoord0 += outDir * (pad / 256.0);
    }

    if (flagLiquid) {

        float vid = mod(float(gl_VertexID), 4.0);
        vec2 outDir;
        if      (vid < 0.5) outDir = vec2(-1.0, -1.0);
        else if (vid < 1.5) outDir = vec2(-1.0,  1.0);
        else if (vid < 2.5) outDir = vec2( 1.0,  1.0);
        else                outDir = vec2( 1.0, -1.0);
        float pad = paramLiquidIntensity + 1.0;
        setOffset(outDir.x * pad, outDir.y * pad);
        applyOffset(vertex);
        texCoord0 += outDir * (pad / 256.0);
    }



    if (flagBob) {
        float bobTime = GameTime * paramBobSpeed;
        setOffset(0.0, sin(bobTime) * paramBobAmplitude);
        applyOffset(vertex);
    }

    if (flagSway) {
        float swayTime = GameTime * paramSwaySpeed;
        setOffset(sin(swayTime) * paramSwayAmplitude, 0.0);
        applyOffset(vertex);
    }

    if (flagZigzag) {
        float zCharId = (ProjMat[3][3] != 0.0) ? floor(Position.x / 6.0) : floor(float(gl_VertexID) / 4.0);
        float zPhase = fract(GameTime * paramZigzagSpeed);
        float zTri = abs(zPhase * 2.0 - 1.0);
        float zSide = (mod(zCharId, 2.0) < 1.0) ? 1.0 : -1.0;
        setOffset(0.0, zSide * zTri * paramZigzagAmplitude);
        applyOffset(vertex);
    }

    if (flagWobble) {
        float wCharId = (ProjMat[3][3] != 0.0) ? floor(Position.x / 6.0) : floor(float(gl_VertexID) / 4.0);
        float wSide = (mod(wCharId, 2.0) < 1.0) ? 1.0 : -1.0;
        setOffset(0.0, wSide * sin(GameTime * paramWobbleSpeed) * paramWobbleAmplitude);
        applyOffset(vertex);
    }

    if (flagFall) {
        float fallRange = 40.0;
        float fallPos = mod(GameTime * paramFallSpeed * 120.0, fallRange);
        setOffset(0.0, fallPos - fallRange);
        applyOffset(vertex);
    }

    if (flagRise) {
        float riseRange = 40.0;
        setOffset(0.0, mod(GameTime * paramRiseSpeed * 120.0, riseRange));
        applyOffset(vertex);
    }

    if (flagOrbit) {
        float oCharId = (ProjMat[3][3] != 0.0) ? floor(Position.x / 6.0) : floor(float(gl_VertexID) / 4.0);
        float oAngle = GameTime * paramOrbitSpeed + oCharId * 0.7;
        setOffset(cos(oAngle) * paramOrbitRadius, sin(oAngle) * paramOrbitRadius * 0.6);
        applyOffset(vertex);
    }

    if (flagDrift) {
        float dPos = mod(GameTime * paramDriftSpeed * 40.0, 40.0) - 20.0;
        setOffset(dPos, dPos * 0.35);
        applyOffset(vertex);
    }

    if (flagTypewriter) {
        float tCharId = (ProjMat[3][3] != 0.0) ? floor(Position.x / 6.0) : floor(float(gl_VertexID) / 4.0);
        float tPhase = fract(tCharId * 0.15 - GameTime * paramTypewriterSpeed);
        if (tPhase < 0.15) {
            setOffset(0.0, 100000.0);
            applyOffset(vertex);
        }
    }

    if (flagErase) {
        float eCharId = (ProjMat[3][3] != 0.0) ? floor(Position.x / 6.0) : floor(float(gl_VertexID) / 4.0);
        float ePhase = fract(eCharId * 0.15 - GameTime * paramEraseSpeed);
        if (ePhase > 0.85) {
            setOffset(0.0, 100000.0);
            applyOffset(vertex);
        }
    }

    if (flagHeartbeat) {
        float hbTime = GameTime * paramHeartbeatSpeed * 1000.0;
        float hbThump1 = pow(max(0.0, sin(hbTime)), 10.0);
        float hbThump2 = 0.6 * pow(max(0.0, sin(hbTime - 1.2)), 10.0);
        float hbExpansion = (hbThump1 + hbThump2) * paramHeartbeatSize * 2.5;
        float hbVid = mod(float(gl_VertexID), 4.0);
        vec2 hbDir = vec2(0.0);
        if (hbVid < 0.5) hbDir = vec2(-1.0, -1.0);
        else if (hbVid < 1.5) hbDir = vec2(-1.0, 1.0);
        else if (hbVid < 2.5) hbDir = vec2(1.0, 1.0);
        else hbDir = vec2(1.0, -1.0);
        hbDir *= vec2(0.7, 1.0);
        setOffset(hbDir.x * hbExpansion, hbDir.y * hbExpansion);
        applyOffset(vertex);
    }

    float preX = vertex.x;
    float preY = vertex.y;




    if (flagSequentialSpin) {
        processSequentialSpin(vertex, paramSpinSpeed, 0.0);
    } else if (flagSpin) {
        processSpin(vertex, paramSpinSpeed, 0.0);
    } else {
        applyProjection(vertex);
    }




    if (flagWavy) {
        bool isGUI = ProjMat[3][3] != 0.0;
        if (isGUI) {
            gl_Position.y += sin(GameTime * paramWaveSpeed + (Position.x * paramWaveXFrequency)) * (paramWaveAmplitude / 150.0);
        } else {
            float charId = floor(float(gl_VertexID) / 4.0);
            float vid = mod(float(gl_VertexID), 4.0);
            float charX = charId + step(1.5, vid);
            float wave = sin(GameTime * paramWaveSpeed + charX * paramWaveXFrequency * 6.0) * paramWaveAmplitude * 0.05;
            gl_Position.y += ProjMat[1][1] * wave;
        }
    }




    if (flagAurora) {
        float s = isShadow ? 0.25 : 1.0;
        bool isGUI = ProjMat[3][3] != 0.0;
        float spatialAurora;
        if (isGUI) {
            spatialAurora = preX + preY;
        } else {
            float aCharId = floor(float(gl_VertexID) / 4.0);
            float aVid    = mod(float(gl_VertexID), 4.0);
            float aXt = (aVid == 2.0 || aVid == 3.0) ? 1.0 : 0.0;
            float aYt = (aVid == 1.0 || aVid == 2.0) ? 1.0 : 0.0;
            spatialAurora = (aCharId + aXt) * 6.0 + aYt * 7.0;
        }
        float auroraT = fract(GameTime * paramAuroraSpeed + spatialAurora * 0.01);
        float third = 1.0 / 3.0;
        vec3 auroraColor;
        float auroraAlpha;
        if (auroraT < third) {
            float lt = auroraT / third;
            auroraColor = mix(paramAuroraColor1, paramAuroraColor2, lt);
            auroraAlpha = mix(paramAuroraColor1A, paramAuroraColor2A, lt);
        } else if (auroraT < 2.0 * third) {
            float lt = (auroraT - third) / third;
            auroraColor = mix(paramAuroraColor2, paramAuroraColor3, lt);
            auroraAlpha = mix(paramAuroraColor2A, paramAuroraColor3A, lt);
        } else {
            float lt = (auroraT - 2.0 * third) / third;
            auroraColor = mix(paramAuroraColor3, paramAuroraColor1, lt);
            auroraAlpha = mix(paramAuroraColor3A, paramAuroraColor1A, lt);
        }
        vec4 texColor = get_lightmap_color();
        vertexColor = vec4(auroraColor * s, auroraAlpha * displayColor.a) * texColor;
    } else if (flagRainbow) {
        applyHueColor(paramRainbowSpeed, preX, preY, displayColor.a);
    } else if (flagDynamicGradient) {
        float s = isShadow ? 0.25 : 1.0;
        int dynDir = int(paramDynGradientDirection);





        bool isGUI = ProjMat[3][3] != 0.0;
        float spatialX, spatialY;
        if (isGUI) {
            spatialX = preX;
            spatialY = preY;
        } else {
            float dynCharId = floor(float(gl_VertexID) / 4.0);
            float dynVid = mod(float(gl_VertexID), 4.0);
            float dynXt = (dynVid == 2.0 || dynVid == 3.0) ? 1.0 : 0.0;
            float dynYt = (dynVid == 1.0 || dynVid == 2.0) ? 1.0 : 0.0;
            spatialX = (dynCharId + dynXt) * 6.0;
            spatialY = dynYt * 7.0;
        }

        float spatial;
        if      (dynDir == 0) spatial =  spatialY;
        else if (dynDir == 1) spatial =  spatialX + spatialY;
        else if (dynDir == 2) spatial =  spatialX;
        else if (dynDir == 3) spatial =  spatialX - spatialY;
        else if (dynDir == 4) spatial = -spatialY;
        else if (dynDir == 5) spatial = -spatialX - spatialY;
        else if (dynDir == 6) spatial = -spatialX;
        else                  spatial = -spatialX + spatialY;
        float dynT = 1.0 - abs(fract(GameTime * paramDynGradientSpeed + spatial * 0.01) * 2.0 - 1.0);
        vec3 dynColor = mix(paramDynGradientStart * s, paramDynGradientEnd * s, dynT);
        float dynAlpha = mix(paramDynGradientStartA, paramDynGradientEndA, dynT);
        vec4 texColor = get_lightmap_color();
        vertexColor = vec4(dynColor, dynAlpha * displayColor.a) * texColor;
    } else if (flagGradient) {
        float s = isShadow ? 0.25 : 1.0;
        float vid = mod(float(gl_VertexID), 4.0);
        float x_t = (vid == 2.0 || vid == 3.0) ? 1.0 : 0.0;
        float y_t = (vid == 1.0 || vid == 2.0) ? 1.0 : 0.0;
        int gradDir = int(paramGradientDirection);
        float gradT;
        if      (gradDir == 0) gradT = 1.0 - y_t;
        else if (gradDir == 1) gradT = (x_t + (1.0 - y_t)) * 0.5;
        else if (gradDir == 2) gradT = x_t;
        else if (gradDir == 3) gradT = (x_t + y_t) * 0.5;
        else if (gradDir == 4) gradT = y_t;
        else if (gradDir == 5) gradT = ((1.0 - x_t) + y_t) * 0.5;
        else if (gradDir == 6) gradT = 1.0 - x_t;
        else                   gradT = ((1.0 - x_t) + (1.0 - y_t)) * 0.5;
        vec3 gradColor = mix(paramGradientStart * s, paramGradientEnd * s, gradT);
        float gradAlpha = mix(paramGradientStartA, paramGradientEndA, gradT);
        vec4 texColor = get_lightmap_color();
        vertexColor = vec4(gradColor, gradAlpha * displayColor.a) * texColor;
    } else {
        vertexColor = displayColor * get_lightmap_color();
    }




    fshBaseColor = displayColor;
    fshEffectID = 0.0;
    if (flagOutline) {
        fshEffectID = 1.0;
        fshEffectColor = paramOutlineColor;
        fshEffectParams = vec4(paramOutlineThickness, 0.0, 0.0, 0.0);
    } else if (flagHatch) {
        fshEffectID = 2.0;
        fshEffectColor = paramHatchColor;
        fshEffectParams = vec4(0.0, paramHatchSpeed, paramHatchDensity, 0.0);
    } else if (flagNeon) {
        fshEffectID = 3.0;
        fshEffectColor = paramNeonColor;
        fshEffectParams = vec4(paramNeonIntensity, paramNeonSpeed, 0.0, 0.0);
    } else if (flagSplit) {
        fshEffectID = 5.0;
        fshEffectColor = displayColor;
        fshEffectParams = vec4(paramSplitIntensity, paramSplitSpeed, 0.0, 0.0);
    } else if (flagChromatic) {
        fshEffectID = 6.0;
        fshEffectColor = displayColor;
        fshEffectParams = vec4(paramChromaticIntensity, paramChromaticSpeed, 0.0, 0.0);
    } else if (flagExtrude) {
        fshEffectID = 7.0;
        fshEffectColor   = paramExtrudeColor;
        fshExtrudeColor2 = paramExtrudeColor2;
        fshExtrudeColor3 = paramExtrudeColor3;
        fshEffectParams = vec4(paramExtrudeDepth, paramExtrudeLayers, paramExtrudeUseColor, 0.0);
    } else if (flagNoise) {
        fshEffectID = 8.0;
        fshEffectColor = displayColor;
        fshEffectParams = vec4(paramNoiseIntensity, paramNoiseSpeed, 0.0, 0.0);
    } else if (flagLiquid) {
        fshEffectID = 9.0;
        fshEffectColor = displayColor;
        fshEffectParams = vec4(paramLiquidIntensity, paramLiquidSpeed, 0.0, 0.0);
    } else if (flagWater) {
        fshEffectID = 10.0;
        fshEffectColor = paramWaterColor;
        fshEffectParams = vec4(paramWaterLevel, paramWaterAmplitude, paramWaterSpeed, paramWaterFrequency);
    }

    fshGlyphT0 = vec3(0.0);
    fshGlyphT1 = vec3(0.0);
    fshGlyphT2 = vec3(0.0);
    fshGlyphT3 = vec3(0.0);
    if (flagOutline || flagNeon || flagHatch || flagSplit ||
        flagChromatic || flagExtrude || flagNoise || flagLiquid || flagWater) {
        int vid_glyph = gl_VertexID % 4;
        if (vid_glyph == 0) fshGlyphT0 = vec3(UV0, 1.0);
        if (vid_glyph == 1) fshGlyphT2 = vec3(UV0, 1.0);
        if (vid_glyph == 2) fshGlyphT1 = vec3(UV0, 1.0);
        if (vid_glyph == 3) fshGlyphT3 = vec3(UV0, 1.0);
    }




    if (flagFade) {
        float fadeAlpha = sin(GameTime * 3000.0 * paramFadeSpeed);
        fadeAlpha = (fadeAlpha + 1.0) * 0.5;
        vertexColor.a *= fadeAlpha;
    }

    if (flagFlicker) {
        float flStep = floor(GameTime * paramFlickerSpeed * 30.0);
        vertexColor.a *= 1.0 - paramFlickerIntensity * 0.6 * random(vec2(flStep, 7.0));
    }

    if (flagBreathe) {
        vertexColor.a *= 0.55 + 0.45 * (sin(GameTime * paramBreatheSpeed * 2.0) * 0.5 + 0.5);
    }







    if (ProjMat[3][3] == 0.0) {
        gl_Position.z -= 0.001;
    }






    vertexColor.a *= Color.a;




    finalize();
}
