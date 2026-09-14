






vec4 currentVertex;
vec4 currentBaseColor;
bool currentIsShadow = false;
bool currentApplyToShadow = false;


bool flagShake = false;
bool flagWavy = false;
bool flagRainbow = false;
bool flagBouncy = false;
bool flagBlinking = false;
bool flagPulse = false;
bool flagSpin = false;
bool flagSequentialSpin = false;
bool flagFade = false;
bool flagIterating = false;
bool flagGlitch = false;
bool flagScale = false;
bool flagGradient = false;
bool flagDynamicGradient = false;
bool flagAurora = false;
bool flagSplit = false;
bool flagOutline = false;
bool flagHatch = false;
bool flagNeon = false;
bool flagColorOverride = false;
bool flagChromatic = false;
bool flagExtrude = false;
bool flagNoise = false;
bool flagLiquid = false;
bool flagWater = false;
bool flagBob = false;
bool flagSway = false;
bool flagZigzag = false;
bool flagWobble = false;
bool flagFall = false;
bool flagRise = false;
bool flagOrbit = false;
bool flagDrift = false;
bool flagTypewriter = false;
bool flagErase = false;
bool flagHeartbeat = false;
bool flagFlicker = false;
bool flagBreathe = false;
bool flagBlask = false;
bool flagIskry = false;
bool flagPlomien = false;
bool flagPopcorn = false;
bool flagEksplozja = false;
bool flagWinda = false;
bool flagDeszcz = false;
bool flagMrugacz = false;
bool flagSkoczki = false;
bool flagLaser = false;
bool flagHolo = false;
bool flagGlitchHard = false;
bool flagMatrix = false;
bool flagCaustics = false;
bool flagWarp = false;
bool flagKrysztal = false;
bool flagPortal = false;
bool flagXray = false;
bool flagTermowizja = false;
bool flagTornado = false;
bool flagWahadlo = false;
bool flagWibracja = false;
bool flagPrzegon = false;
bool flagBumper = false;
bool flagHarmonijka = false;


float paramShakeSpeed = SHAKE_SPEED;
float paramShakeIntensity = SHAKE_INTENSITY;
float paramWaveSpeed = WAVE_SPEED;
float paramWaveAmplitude = WAVE_AMPLITUDE;
float paramWaveXFrequency = WAVE_X_FREQUENCY;
float paramRainbowSpeed = RAINBOW_SPEED;
float paramBounceSpeed = BOUNCE_SPEED;
float paramBounceAmplitude = BOUNCE_AMPLITUDE;
float paramBlinkSpeed = BLINK_SPEED;
float paramPulseSpeed = PULSE_SPEED;
float paramPulseSize = PULSE_SIZE;
float paramSpinSpeed = SPIN_SPEED;
float paramFadeSpeed = FADE_SPEED;
float paramIteratingSpeed = ITERATING_SPEED;
float paramIteratingSpace = ITERATING_SPACE;
float paramGlitchSpeed = GLITCH_SPEED;
float paramGlitchIntensity = GLITCH_INTENSITY;
float paramScaleFactor = SCALE_FACTOR;
float paramScaleOffsetX = SCALE_OFFSET_X;
float paramScaleOffsetY = SCALE_OFFSET_Y;
vec3 paramGradientStart = GRADIENT_START;
float paramGradientStartA = 1.0;
vec3 paramGradientEnd = GRADIENT_END;
float paramGradientEndA = 1.0;
float paramGradientDirection = GRADIENT_DIRECTION;
vec3 paramDynGradientStart = DYN_GRADIENT_START;
float paramDynGradientStartA = 1.0;
vec3 paramDynGradientEnd = DYN_GRADIENT_END;
float paramDynGradientEndA = 1.0;
float paramDynGradientDirection = DYN_GRADIENT_DIRECTION;
float paramDynGradientSpeed = DYN_GRADIENT_SPEED;
vec3 paramAuroraColor1 = AURORA_COLOR_1;
float paramAuroraColor1A = 1.0;
vec3 paramAuroraColor2 = AURORA_COLOR_2;
float paramAuroraColor2A = 1.0;
vec3 paramAuroraColor3 = AURORA_COLOR_3;
float paramAuroraColor3A = 1.0;
float paramAuroraSpeed = AURORA_SPEED;
float paramSplitIntensity = SPLIT_INTENSITY;
float paramSplitSpeed = SPLIT_SPEED;
vec4 paramOutlineColor = OUTLINE_COLOR;
float paramOutlineThickness = OUTLINE_THICKNESS;
vec4 paramHatchColor = HATCH_COLOR;
float paramHatchSpeed = HATCH_SPEED;
float paramHatchDensity = HATCH_DENSITY;
vec4 paramNeonColor = NEON_COLOR;
float paramNeonIntensity = NEON_INTENSITY;
float paramNeonSpeed = NEON_SPEED;
float paramChromaticIntensity = CHROMATIC_INTENSITY;
float paramChromaticSpeed = CHROMATIC_SPEED;
float paramExtrudeDepth = EXTRUDE_DEPTH;
float paramExtrudeLayers = EXTRUDE_LAYERS;
vec4 paramExtrudeColor = EXTRUDE_COLOR;
vec4 paramExtrudeColor2 = EXTRUDE_COLOR2;
vec4 paramExtrudeColor3 = EXTRUDE_COLOR3;
float paramExtrudeUseColor = 0.0;
float paramNoiseIntensity = NOISE_INTENSITY;
float paramNoiseSpeed = NOISE_SPEED;
float paramLiquidIntensity = LIQUID_INTENSITY;
float paramLiquidSpeed = LIQUID_SPEED;
vec4  paramWaterColor     = WATER_COLOR;
float paramWaterLevel     = WATER_LEVEL;
float paramWaterAmplitude = WATER_AMPLITUDE;
float paramWaterSpeed     = WATER_SPEED;
float paramWaterFrequency = WATER_FREQUENCY;
float paramBobSpeed = BOB_SPEED;
float paramBobAmplitude = BOB_AMPLITUDE;
float paramSwaySpeed = SWAY_SPEED;
float paramSwayAmplitude = SWAY_AMPLITUDE;
float paramZigzagSpeed = ZIGZAG_SPEED;
float paramZigzagAmplitude = ZIGZAG_AMPLITUDE;
float paramWobbleSpeed = WOBBLE_SPEED;
float paramWobbleAmplitude = WOBBLE_AMPLITUDE;
float paramFallSpeed = FALL_SPEED;
float paramRiseSpeed = RISE_SPEED;
float paramOrbitSpeed = ORBIT_SPEED;
float paramOrbitRadius = ORBIT_RADIUS;
float paramDriftSpeed = DRIFT_SPEED;
float paramTypewriterSpeed = TYPEWRITER_SPEED;
float paramEraseSpeed = ERASE_SPEED;
float paramHeartbeatSpeed = HEARTBEAT_SPEED;
float paramHeartbeatSize = HEARTBEAT_SIZE;
float paramFlickerSpeed = FLICKER_SPEED;
float paramFlickerIntensity = FLICKER_INTENSITY;
float paramBreatheSpeed = BREATHE_SPEED;
vec4 paramBlaskColor = BLASK_COLOR;
float paramBlaskIntensity = BLASK_INTENSITY;
float paramBlaskSpeed = BLASK_SPEED;
float paramBlaskWidth = BLASK_WIDTH;
vec4 paramIskryColor = ISKRY_COLOR;
float paramIskryIntensity = ISKRY_INTENSITY;
float paramIskrySpeed = ISKRY_SPEED;
float paramIskryDensity = ISKRY_DENSITY;
float paramPlomienIntensity = PLOMIEN_INTENSITY;
float paramPlomienSpeed = PLOMIEN_SPEED;
float paramPopcornSpeed = POPCORN_SPEED;
float paramPopcornSize = POPCORN_SIZE;
float paramEksplozjaSpeed = EKSPLOZJA_SPEED;
float paramEksplozjaRadius = EKSPLOZJA_RADIUS;
float paramWindaSpeed = WINDA_SPEED;
float paramDeszczSpeed = DESZCZ_SPEED;
float paramMrugaczSpeed = MRUGACZ_SPEED;
float paramSkoczkiSpeed = SKOCZKI_SPEED;
float paramSkoczkiAmplitude = SKOCZKI_AMPLITUDE;
vec4 paramLaserColor = LASER_COLOR;
float paramLaserSpeed = LASER_SPEED;
float paramLaserWidth = LASER_WIDTH;
vec4 paramHoloColor = HOLO_COLOR;
float paramHoloSpeed = HOLO_SPEED;
float paramHoloLines = HOLO_LINES;
vec4 paramGlitchHardColor = GLITCH_HARD_COLOR;
float paramGlitchHardSpeed = GLITCH_HARD_SPEED;
float paramGlitchHardStrength = GLITCH_HARD_STRENGTH;
vec4 paramMatrixColor = MATRIX_COLOR;
float paramMatrixSpeed = MATRIX_SPEED;
float paramMatrixCols = MATRIX_COLS;
vec4 paramCausticsColor = CAUSTICS_COLOR;
float paramCausticsSpeed = CAUSTICS_SPEED;
float paramCausticsScale = CAUSTICS_SCALE;
vec4 paramWarpColor = WARP_COLOR;
float paramWarpSpeed = WARP_SPEED;
float paramWarpStrength = WARP_STRENGTH;
vec4 paramKrysztalColor = KRYSTZAL_COLOR;
float paramKrysztalSpeed = KRYSTZAL_SPEED;
float paramKrysztalCells = KRYSTZAL_CELLS;
vec4 paramPortalColor = PORTAL_COLOR;
float paramPortalSpeed = PORTAL_SPEED;
float paramPortalSwirls = PORTAL_SWIRLS;
vec4 paramXrayColor = XRAY_COLOR;
float paramXraySpeed = XRAY_SPEED;
float paramXrayWidth = XRAY_WIDTH;
vec4 paramTermowizjaColor = TERMOWIZJA_COLOR;
float paramTermowizjaSpeed = TERMOWIZJA_SPEED;
float paramTermowizjaContrast = TERMOWIZJA_CONTRAST;
float paramTornadoSpeed = TORNADO_SPEED;
float paramTornadoSize = TORNADO_SIZE;
float paramWahadloSpeed = WAHADLO_SPEED;
float paramWahadloSize = WAHADLO_SIZE;
float paramWibracjaSpeed = WIBRACJA_SPEED;
float paramWibracjaSize = WIBRACJA_SIZE;
float paramPrzegonSpeed = PRZEGON_SPEED;
float paramPrzegonSize = PRZEGON_SIZE;
float paramBumperSpeed = BUMPER_SPEED;
float paramBumperSize = BUMPER_SIZE;
float paramHarmonijkaSpeed = HARMONIJKA_SPEED;
float paramHarmonijkaSize = HARMONIJKA_SIZE;


vec3 rgb(float r, float g, float b) {
    return vec3(r / 255.0, g / 255.0, b / 255.0);
}


vec3 rgb(uint rgb_v) {
    float r = float((rgb_v >> 16) & 0xFFu) / 255.0;
    float g = float((rgb_v >> 8)  & 0xFFu) / 255.0;
    float b = float( rgb_v        & 0xFFu) / 255.0;
    return vec3(r, g, b);
}


vec3 rgb(int irgb_v) {
    return rgb(uint(irgb_v));
}


vec4 rgba(float r, float g, float b, float a) {
    return vec4(r / 255.0, g / 255.0, b / 255.0, a);
}


vec4 rgba(uint v) {
    float r = float((v >> 24) & 0xFFu) / 255.0;
    float g = float((v >> 16) & 0xFFu) / 255.0;
    float b = float((v >> 8)  & 0xFFu) / 255.0;
    float a = float( v        & 0xFFu) / 255.0;
    return vec4(r, g, b, a);
}


vec4 rgba(int irgba_v) {
    return rgba(uint(irgba_v));
}


vec4 argb(float a, float r, float g, float b) {
    return vec4(r / 255.0, g / 255.0, b / 255.0, a);
}


vec4 argb(uint v) {
    float a = float((v >> 24) & 0xFFu) / 255.0;
    float r = float((v >> 16) & 0xFFu) / 255.0;
    float g = float((v >> 8)  & 0xFFu) / 255.0;
    float b = float( v        & 0xFFu) / 255.0;
    return vec4(r, g, b, a);
}


vec4 argb(int iargb_v) {
    return argb(uint(iargb_v));
}


void apply_color(vec3 color) {
    currentBaseColor.rgb = color;
    flagColorOverride = true;
}




void apply_color(vec4 color) {
    currentBaseColor = color;
    flagColorOverride = true;
}


bool hasAnyEffect() {
    return flagShake || flagWavy || flagRainbow || flagBouncy || flagBlinking ||
           flagPulse || flagSpin || flagSequentialSpin || flagFade ||
           flagIterating || flagGlitch || flagScale || flagGradient || flagDynamicGradient ||
           flagAurora || flagSplit || flagOutline || flagHatch || flagNeon ||
           flagColorOverride || flagChromatic || flagExtrude || flagNoise || flagLiquid || flagWater || flagBob || flagSway || flagZigzag || flagWobble ||
           flagFall || flagRise || flagOrbit || flagDrift || flagTypewriter ||
           flagErase || flagHeartbeat || flagFlicker || flagBreathe ||
           flagBlask || flagIskry || flagPlomien || flagPopcorn || flagEksplozja ||
           flagWinda || flagDeszcz || flagMrugacz || flagSkoczki ||
           flagLaser || flagHolo || flagGlitchHard || flagMatrix || flagCaustics ||
           flagWarp || flagKrysztal || flagPortal || flagXray || flagTermowizja ||
           flagTornado || flagWahadlo || flagWibracja || flagPrzegon || flagBumper || flagHarmonijka;
}


void apply_shake() {
    flagShake = true;
}

void apply_shake(float speed, float intensity) {
    flagShake = true;
    paramShakeSpeed = speed;
    paramShakeIntensity = intensity;
}


void apply_wavy() {
    flagWavy = true;
}

void apply_wavy(float speed) {
    flagWavy = true;
    paramWaveSpeed = speed;
}

void apply_wavy(float speed, float amplitude) {
    flagWavy = true;
    paramWaveSpeed = speed;
    paramWaveAmplitude = amplitude;
}

void apply_wavy(float speed, float amplitude, float xFrequency) {
    flagWavy = true;
    paramWaveSpeed = speed;
    paramWaveAmplitude = amplitude;
    paramWaveXFrequency = xFrequency;
}


void apply_rainbow() {
    flagRainbow = true;
}

void apply_rainbow(float speed) {
    flagRainbow = true;
    paramRainbowSpeed = speed;
}


void apply_bouncy() {
    flagBouncy = true;
}

void apply_bouncy(float speed) {
    flagBouncy = true;
    paramBounceSpeed = speed;
}

void apply_bouncy(float speed, float amplitude) {
    flagBouncy = true;
    paramBounceSpeed = speed;
    paramBounceAmplitude = amplitude;
}


void apply_blinking() {
    flagBlinking = true;
}

void apply_blinking(float speed) {
    flagBlinking = true;
    paramBlinkSpeed = speed;
}


void apply_pulse() {
    flagPulse = true;
}

void apply_pulse(float speed) {
    flagPulse = true;
    paramPulseSpeed = speed;
}

void apply_pulse(float speed, float size) {
    flagPulse = true;
    paramPulseSpeed = speed;
    paramPulseSize = size;
}


void apply_spin() {
    flagSpin = true;
}

void apply_spin(float speed) {
    flagSpin = true;
    paramSpinSpeed = speed;
}


void apply_sequential_spin() {
    flagSequentialSpin = true;
}

void apply_sequential_spin(float speed) {
    flagSequentialSpin = true;
    paramSpinSpeed = speed;
}


void apply_fade() {
    flagFade = true;
}

void apply_fade(float speed) {
    flagFade = true;
    paramFadeSpeed = speed;
}


void apply_iterating() {
    flagIterating = true;
}

void apply_iterating(float speed) {
    flagIterating = true;
    paramIteratingSpeed = speed;
}

void apply_iterating(float speed, float space) {
    flagIterating = true;
    paramIteratingSpeed = speed;
    paramIteratingSpace = space;
}


void apply_scale(float scale) {
    flagScale = true;
    paramScaleFactor = scale;
}

void apply_scale(float scale, float offsetX, float offsetY) {
    flagScale = true;
    paramScaleFactor = scale;
    paramScaleOffsetX = offsetX;
    paramScaleOffsetY = offsetY;
}

void apply_offset(float offsetX, float offsetY) {
    if (!flagScale) {
        paramScaleFactor = 1.0;
    }
    flagScale = true;
    paramScaleFactor = 0.0;
    paramScaleOffsetX = offsetX;
    paramScaleOffsetY = offsetY;
}


void apply_glitch() {
    flagGlitch = true;
}

void apply_glitch(float speed, float intensity) {
    flagGlitch = true;
    paramGlitchSpeed = speed;
    paramGlitchIntensity = intensity;
}


void apply_gradient(vec3 start, vec3 end, float direction) {
    flagGradient = true;
    paramGradientStart = start;
    paramGradientEnd = end;
    paramGradientDirection = direction;
}

void apply_gradient(vec4 start, vec4 end, float direction) {
    flagGradient = true;
    paramGradientStart = start.rgb;
    paramGradientStartA = start.a;
    paramGradientEnd = end.rgb;
    paramGradientEndA = end.a;
    paramGradientDirection = direction;
}

void apply_gradient(vec3 start, vec3 end) {
    apply_gradient(start, end, GRADIENT_DIRECTION);
}

void apply_gradient() {
    flagGradient = true;
}


void apply_dynamic_gradient(vec3 start, vec3 end, float direction, float speed) {
    flagDynamicGradient = true;
    paramDynGradientStart = start;
    paramDynGradientEnd = end;
    paramDynGradientDirection = direction;
    paramDynGradientSpeed = speed;
}

void apply_dynamic_gradient(vec4 start, vec4 end, float direction, float speed) {
    flagDynamicGradient = true;
    paramDynGradientStart = start.rgb;
    paramDynGradientStartA = start.a;
    paramDynGradientEnd = end.rgb;
    paramDynGradientEndA = end.a;
    paramDynGradientDirection = direction;
    paramDynGradientSpeed = speed;
}

void apply_dynamic_gradient(vec3 start, vec3 end, float direction) {
    apply_dynamic_gradient(start, end, direction, DYN_GRADIENT_SPEED);
}

void apply_dynamic_gradient(vec3 start, vec3 end) {
    apply_dynamic_gradient(start, end, DYN_GRADIENT_DIRECTION, DYN_GRADIENT_SPEED);
}

void apply_dynamic_gradient() {
    flagDynamicGradient = true;
}

void apply_lava(float speed) {
    apply_dynamic_gradient(rgb(255, 20, 0), rgb(255, 200, 0), 2.0, speed);
}

void apply_lava() {
    apply_lava(300.0);
}


void apply_aurora(vec4 c1, vec4 c2, vec4 c3, float speed) {
    flagAurora = true;
    paramAuroraColor1 = c1.rgb; paramAuroraColor1A = c1.a;
    paramAuroraColor2 = c2.rgb; paramAuroraColor2A = c2.a;
    paramAuroraColor3 = c3.rgb; paramAuroraColor3A = c3.a;
    paramAuroraSpeed = speed;
}

void apply_aurora(vec3 c1, vec3 c2, vec3 c3, float speed) {
    flagAurora = true;
    paramAuroraColor1 = c1;
    paramAuroraColor2 = c2;
    paramAuroraColor3 = c3;
    paramAuroraSpeed = speed;
}

void apply_aurora(float speed) {
    flagAurora = true;
    paramAuroraSpeed = speed;
}

void apply_aurora() {
    flagAurora = true;
}


void apply_split(float intensity, float speed) {
    flagSplit = true;
    paramSplitIntensity = intensity;
    paramSplitSpeed = speed;
}

void apply_split(float intensity) {
    flagSplit = true;
    paramSplitIntensity = intensity;
}

void apply_split() {
    flagSplit = true;
}


void apply_outline(vec4 color, float thickness) {
    flagOutline = true;
    paramOutlineColor = color;
    paramOutlineThickness = thickness;
}

void apply_outline(vec3 color, float thickness) {
    flagOutline = true;
    paramOutlineColor = vec4(color, 1.0);
    paramOutlineThickness = thickness;
}

void apply_outline(vec3 color) {
    flagOutline = true;
    paramOutlineColor = vec4(color, 1.0);
}

void apply_outline() {
    flagOutline = true;
}


void apply_hatch(vec4 color, float speed, float density) {
    flagHatch = true;
    paramHatchColor = color;
    paramHatchSpeed = speed;
    paramHatchDensity = density;
}

void apply_hatch(vec3 color, float speed, float density) {
    flagHatch = true;
    paramHatchColor = vec4(color, 1.0);
    paramHatchSpeed = speed;
    paramHatchDensity = density;
}

void apply_hatch(float speed) {
    flagHatch = true;
    paramHatchSpeed = speed;
}

void apply_hatch() {
    flagHatch = true;
}


void apply_neon(vec4 color, float intensity, float speed) {
    flagNeon = true;
    paramNeonColor = color;
    paramNeonIntensity = intensity;
    paramNeonSpeed = speed;
}

void apply_neon(vec3 color, float intensity) {
    flagNeon = true;
    paramNeonColor = vec4(color, 1.0);
    paramNeonIntensity = intensity;
}

void apply_neon(vec3 color) {
    flagNeon = true;
    paramNeonColor = vec4(color, 1.0);
}

void apply_neon() {
    flagNeon = true;
}


void apply_chromatic() {
    flagChromatic = true;
}

void apply_chromatic(float intensity) {
    flagChromatic = true;
    paramChromaticIntensity = intensity;
}

void apply_chromatic(float intensity, float speed) {
    flagChromatic = true;
    paramChromaticIntensity = intensity;
    paramChromaticSpeed = speed;
}


void apply_extrude() {
    flagExtrude = true;
    paramExtrudeUseColor = 0.0;
}

void apply_extrude(float depth) {
    flagExtrude = true;
    paramExtrudeDepth = depth;
    paramExtrudeUseColor = 0.0;
}

void apply_extrude(float depth, float layers) {
    flagExtrude = true;
    paramExtrudeDepth = depth;
    paramExtrudeLayers = layers;
    paramExtrudeUseColor = 0.0;
}

void apply_extrude(float depth, float layers, vec3 endColor) {
    flagExtrude = true;
    paramExtrudeDepth = depth;
    paramExtrudeLayers = layers;
    paramExtrudeColor = vec4(endColor, 1.0);
    paramExtrudeUseColor = 1.0;
}

void apply_extrude(float depth, float layers, vec4 endColor) {
    flagExtrude = true;
    paramExtrudeDepth = depth;
    paramExtrudeLayers = layers;
    paramExtrudeColor = endColor;
    paramExtrudeUseColor = 1.0;
}

void apply_extrude(float depth, float layers, vec3 c1, vec3 c2, vec3 c3) {
    flagExtrude = true;
    paramExtrudeDepth = depth;
    paramExtrudeLayers = layers;
    paramExtrudeColor  = vec4(c1, 1.0);
    paramExtrudeColor2 = vec4(c2, 1.0);
    paramExtrudeColor3 = vec4(c3, 1.0);
    paramExtrudeUseColor = 2.0;
}

void apply_extrude(float depth, float layers, vec4 c1, vec4 c2, vec4 c3) {
    flagExtrude = true;
    paramExtrudeDepth = depth;
    paramExtrudeLayers = layers;
    paramExtrudeColor  = c1;
    paramExtrudeColor2 = c2;
    paramExtrudeColor3 = c3;
    paramExtrudeUseColor = 2.0;
}


void apply_noise() {
    flagNoise = true;
}

void apply_noise(float intensity) {
    flagNoise = true;
    paramNoiseIntensity = intensity;
}

void apply_noise(float intensity, float speed) {
    flagNoise = true;
    paramNoiseIntensity = intensity;
    paramNoiseSpeed = speed;
}


void apply_liquid() {
    flagLiquid = true;
}

void apply_liquid(float intensity) {
    flagLiquid = true;
    paramLiquidIntensity = intensity;
}

void apply_liquid(float intensity, float speed) {
    flagLiquid = true;
    paramLiquidIntensity = intensity;
    paramLiquidSpeed = speed;
}


void apply_water() {
    flagWater = true;
}
void apply_water(vec3 color) {
    flagWater = true;
    paramWaterColor = vec4(color, 1.0);
}
void apply_water(vec4 color) {
    flagWater = true;
    paramWaterColor = color;
}
void apply_water(vec3 color, float level) {
    flagWater = true;
    paramWaterColor = vec4(color, 1.0);
    paramWaterLevel = level;
}
void apply_water(vec3 color, float level, float amplitude, float speed) {
    flagWater = true;
    paramWaterColor = vec4(color, 1.0);
    paramWaterLevel = level;
    paramWaterAmplitude = amplitude;
    paramWaterSpeed = speed;
}
void apply_water(vec4 color, float level, float amplitude, float speed) {
    flagWater = true;
    paramWaterColor = color;
    paramWaterLevel = level;
    paramWaterAmplitude = amplitude;
    paramWaterSpeed = speed;
}
void apply_water(vec3 color, float level, float amplitude, float speed, float frequency) {
    flagWater = true;
    paramWaterColor = vec4(color, 1.0);
    paramWaterLevel = level;
    paramWaterAmplitude = amplitude;
    paramWaterSpeed = speed;
    paramWaterFrequency = frequency;
}

void apply_bob() {
    flagBob = true;
}

void apply_bob(float speed) {
    flagBob = true;
    paramBobSpeed = speed;
}

void apply_bob(float speed, float amplitude) {
    flagBob = true;
    paramBobSpeed = speed;
    paramBobAmplitude = amplitude;
}

void apply_sway() {
    flagSway = true;
}

void apply_sway(float speed) {
    flagSway = true;
    paramSwaySpeed = speed;
}

void apply_sway(float speed, float amplitude) {
    flagSway = true;
    paramSwaySpeed = speed;
    paramSwayAmplitude = amplitude;
}

void apply_zigzag() {
    flagZigzag = true;
}

void apply_zigzag(float speed) {
    flagZigzag = true;
    paramZigzagSpeed = speed;
}

void apply_zigzag(float speed, float amplitude) {
    flagZigzag = true;
    paramZigzagSpeed = speed;
    paramZigzagAmplitude = amplitude;
}

void apply_wobble() {
    flagWobble = true;
}

void apply_wobble(float speed) {
    flagWobble = true;
    paramWobbleSpeed = speed;
}

void apply_wobble(float speed, float amplitude) {
    flagWobble = true;
    paramWobbleSpeed = speed;
    paramWobbleAmplitude = amplitude;
}

void apply_fall() {
    flagFall = true;
}

void apply_fall(float speed) {
    flagFall = true;
    paramFallSpeed = speed;
}

void apply_rise() {
    flagRise = true;
}

void apply_rise(float speed) {
    flagRise = true;
    paramRiseSpeed = speed;
}

void apply_orbit() {
    flagOrbit = true;
}

void apply_orbit(float speed) {
    flagOrbit = true;
    paramOrbitSpeed = speed;
}

void apply_orbit(float speed, float radius) {
    flagOrbit = true;
    paramOrbitSpeed = speed;
    paramOrbitRadius = radius;
}

void apply_drift() {
    flagDrift = true;
}

void apply_drift(float speed) {
    flagDrift = true;
    paramDriftSpeed = speed;
}

void apply_typewriter() {
    flagTypewriter = true;
}

void apply_typewriter(float speed) {
    flagTypewriter = true;
    paramTypewriterSpeed = speed;
}

void apply_erase() {
    flagErase = true;
}

void apply_erase(float speed) {
    flagErase = true;
    paramEraseSpeed = speed;
}

void apply_heartbeat() {
    flagHeartbeat = true;
}

void apply_heartbeat(float speed) {
    flagHeartbeat = true;
    paramHeartbeatSpeed = speed;
}

void apply_heartbeat(float speed, float size) {
    flagHeartbeat = true;
    paramHeartbeatSpeed = speed;
    paramHeartbeatSize = size;
}

void apply_flicker() {
    flagFlicker = true;
}

void apply_flicker(float speed) {
    flagFlicker = true;
    paramFlickerSpeed = speed;
}

void apply_flicker(float speed, float intensity) {
    flagFlicker = true;
    paramFlickerSpeed = speed;
    paramFlickerIntensity = intensity;
}

void apply_breathe() {
    flagBreathe = true;
}

void apply_breathe(float speed) {
    flagBreathe = true;
    paramBreatheSpeed = speed;
}

void apply_blask() {
    flagBlask = true;
}

void apply_blask(float intensity, float speed, float width) {
    flagBlask = true;
    paramBlaskIntensity = intensity;
    paramBlaskSpeed = speed;
    paramBlaskWidth = width;
}

void apply_blask(float intensity) {
    flagBlask = true;
    paramBlaskIntensity = intensity;
}

void apply_iskry() {
    flagIskry = true;
}

void apply_iskry(float intensity, float speed, float density) {
    flagIskry = true;
    paramIskryIntensity = intensity;
    paramIskrySpeed = speed;
    paramIskryDensity = density;
}

void apply_iskry(float intensity) {
    flagIskry = true;
    paramIskryIntensity = intensity;
}

void apply_plomien() {
    flagPlomien = true;
}

void apply_plomien(float speed) {
    flagPlomien = true;
    paramPlomienSpeed = speed;
}

void apply_plomien(float intensity, float speed) {
    flagPlomien = true;
    paramPlomienIntensity = intensity;
    paramPlomienSpeed = speed;
}

void apply_popcorn() {
    flagPopcorn = true;
}

void apply_popcorn(float speed) {
    flagPopcorn = true;
    paramPopcornSpeed = speed;
}

void apply_popcorn(float speed, float size) {
    flagPopcorn = true;
    paramPopcornSpeed = speed;
    paramPopcornSize = size;
}

void apply_eksplozja() {
    flagEksplozja = true;
}

void apply_eksplozja(float speed) {
    flagEksplozja = true;
    paramEksplozjaSpeed = speed;
}

void apply_eksplozja(float speed, float radius) {
    flagEksplozja = true;
    paramEksplozjaSpeed = speed;
    paramEksplozjaRadius = radius;
}

void apply_winda() {
    flagWinda = true;
}

void apply_winda(float speed) {
    flagWinda = true;
    paramWindaSpeed = speed;
}

void apply_deszcz() {
    flagDeszcz = true;
}

void apply_deszcz(float speed) {
    flagDeszcz = true;
    paramDeszczSpeed = speed;
}

void apply_mrugacz() {
    flagMrugacz = true;
}

void apply_mrugacz(float speed) {
    flagMrugacz = true;
    paramMrugaczSpeed = speed;
}

void apply_skoczki() {
    flagSkoczki = true;
}

void apply_skoczki(float speed) {
    flagSkoczki = true;
    paramSkoczkiSpeed = speed;
}

void apply_skoczki(float speed, float amplitude) {
    flagSkoczki = true;
    paramSkoczkiSpeed = speed;
    paramSkoczkiAmplitude = amplitude;
}

void apply_laser() {
    flagLaser = true;
}

void apply_laser(float speed) {
    flagLaser = true;
    paramLaserSpeed = speed;
}

void apply_laser(float speed, float width) {
    flagLaser = true;
    paramLaserSpeed = speed;
    paramLaserWidth = width;
}

void apply_holo() {
    flagHolo = true;
}

void apply_holo(float speed) {
    flagHolo = true;
    paramHoloSpeed = speed;
}

void apply_holo(float speed, float lines) {
    flagHolo = true;
    paramHoloSpeed = speed;
    paramHoloLines = lines;
}

void apply_glitch_hard() {
    flagGlitchHard = true;
}

void apply_glitch_hard(float speed) {
    flagGlitchHard = true;
    paramGlitchHardSpeed = speed;
}

void apply_glitch_hard(float speed, float strength) {
    flagGlitchHard = true;
    paramGlitchHardSpeed = speed;
    paramGlitchHardStrength = strength;
}

void apply_matrix() {
    flagMatrix = true;
}

void apply_matrix(float speed) {
    flagMatrix = true;
    paramMatrixSpeed = speed;
}

void apply_matrix(float speed, float cols) {
    flagMatrix = true;
    paramMatrixSpeed = speed;
    paramMatrixCols = cols;
}

void apply_caustics() {
    flagCaustics = true;
}

void apply_caustics(float speed) {
    flagCaustics = true;
    paramCausticsSpeed = speed;
}

void apply_caustics(float speed, float scale) {
    flagCaustics = true;
    paramCausticsSpeed = speed;
    paramCausticsScale = scale;
}

void apply_warp() {
    flagWarp = true;
}

void apply_warp(float speed) {
    flagWarp = true;
    paramWarpSpeed = speed;
}

void apply_warp(float speed, float strength) {
    flagWarp = true;
    paramWarpSpeed = speed;
    paramWarpStrength = strength;
}

void apply_krysztal() {
    flagKrysztal = true;
}

void apply_krysztal(float speed) {
    flagKrysztal = true;
    paramKrysztalSpeed = speed;
}

void apply_krysztal(float speed, float cells) {
    flagKrysztal = true;
    paramKrysztalSpeed = speed;
    paramKrysztalCells = cells;
}

void apply_portal() {
    flagPortal = true;
}

void apply_portal(float speed) {
    flagPortal = true;
    paramPortalSpeed = speed;
}

void apply_portal(float speed, float swirls) {
    flagPortal = true;
    paramPortalSpeed = speed;
    paramPortalSwirls = swirls;
}

void apply_xray() {
    flagXray = true;
}

void apply_xray(float speed) {
    flagXray = true;
    paramXraySpeed = speed;
}

void apply_xray(float speed, float width) {
    flagXray = true;
    paramXraySpeed = speed;
    paramXrayWidth = width;
}

void apply_termowizja() {
    flagTermowizja = true;
}

void apply_termowizja(float speed) {
    flagTermowizja = true;
    paramTermowizjaSpeed = speed;
}

void apply_termowizja(float speed, float contrast) {
    flagTermowizja = true;
    paramTermowizjaSpeed = speed;
    paramTermowizjaContrast = contrast;
}

void apply_tornado() {
    flagTornado = true;
}

void apply_tornado(float speed) {
    flagTornado = true;
    paramTornadoSize = speed;
}

void apply_tornado(float speed, float Size) {
    flagTornado = true;
    paramTornadoSize = speed;
    paramTornadoSize = Size;
}

void apply_wahadlo() {
    flagWahadlo = true;
}

void apply_wahadlo(float speed) {
    flagWahadlo = true;
    paramWahadloSize = speed;
}

void apply_wahadlo(float speed, float Size) {
    flagWahadlo = true;
    paramWahadloSize = speed;
    paramWahadloSize = Size;
}

void apply_wibracja() {
    flagWibracja = true;
}

void apply_wibracja(float speed) {
    flagWibracja = true;
    paramWibracjaSize = speed;
}

void apply_wibracja(float speed, float Size) {
    flagWibracja = true;
    paramWibracjaSize = speed;
    paramWibracjaSize = Size;
}

void apply_przegon() {
    flagPrzegon = true;
}

void apply_przegon(float speed) {
    flagPrzegon = true;
    paramPrzegonSize = speed;
}

void apply_przegon(float speed, float Size) {
    flagPrzegon = true;
    paramPrzegonSize = speed;
    paramPrzegonSize = Size;
}

void apply_bumper() {
    flagBumper = true;
}

void apply_bumper(float speed) {
    flagBumper = true;
    paramBumperSize = speed;
}

void apply_bumper(float speed, float Size) {
    flagBumper = true;
    paramBumperSize = speed;
    paramBumperSize = Size;
}

void apply_harmonijka() {
    flagHarmonijka = true;
}

void apply_harmonijka(float speed) {
    flagHarmonijka = true;
    paramHarmonijkaSize = speed;
}

void apply_harmonijka(float speed, float Size) {
    flagHarmonijka = true;
    paramHarmonijkaSize = speed;
    paramHarmonijkaSize = Size;
}
