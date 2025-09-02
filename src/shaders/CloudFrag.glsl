uniform float posterizer_value;
uniform float cloud_random_gen;

varying vec3 vPosition;

// 2D Random
float random (in vec2 st) {
    return fract(sin(dot(st.xy,
                         vec2(12.9898,78.233)))
                 * 43758.5453123);
}

// 2D Noise based on Morgan McGuire @morgan3d
// https://www.shadertoy.com/view/4dS3Wd
float noise (in vec2 st) {
    vec2 i = floor(st);
    vec2 f = fract(st);

    // Four corners in 2D of a tile
    float a = random(i);
    float b = random(i + vec2(1.0, 0.0));
    float c = random(i + vec2(0.0, 1.0));
    float d = random(i + vec2(1.0, 1.0));

    // Smooth Interpolation

    // Cubic Hermine Curve.  Same as SmoothStep()
    vec2 u = f*f*(3.0-2.0*f);
    // u = smoothstep(0.,1.,f);

    // Mix 4 coorners percentages
    return mix(a, b, u.x) +
            (c - a)* u.y * (1.0 - u.x) +
            (d - b) * u.x * u.y;
}

vec3 posterize(vec3 color, float levels) {
    vec3 scaledColor = color * levels;

    vec3 roundedColor = floor(scaledColor);

    vec3 posterizedColor = roundedColor / levels;

    return posterizedColor;
}

void main() {
    vec2 pos = vPosition.xy;
    float n = noise(pos * cloud_random_gen);

    vec3 color_post = posterize(vec3(n), posterizer_value);

    if (distance(color_post.rgb, vec3(0)) <= 0.7) {
        discard;
    } else {
        gl_FragColor = vec4(color_post, 1.0);
    }
}
