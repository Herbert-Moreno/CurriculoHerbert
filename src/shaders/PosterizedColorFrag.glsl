uniform vec3 uColor;
uniform float uPosterizeValue;
uniform bool isSideways;

varying vec3 vPosition;

vec3 posterize(vec3 color, float levels) {
    vec3 scaledColor = color * levels;

    vec3 roundedColor = floor(scaledColor);

    vec3 posterizedColor = roundedColor / levels;

    return posterizedColor;
}

void main() {
    float depth = 0.0;
    vec3 mixed = vec3(0);

    if (isSideways) {
        depth = vPosition.x;
        mixed = mix(uColor, vec3(0), depth);
    } else {
        depth = vPosition.y;
        mixed = mix(vec3(0), uColor, depth);
    }

    mixed = posterize(mixed, uPosterizeValue);

    gl_FragColor = vec4(mixed, 1.0);
}
