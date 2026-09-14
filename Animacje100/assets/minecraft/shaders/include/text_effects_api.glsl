






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
           flagErase || flagHeartbeat || flagFlicker || flagBreathe;
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
