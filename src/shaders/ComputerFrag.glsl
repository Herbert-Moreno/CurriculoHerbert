uniform sampler2D uTexture;
uniform float uPosterizeValue;

varying vec2 vUv; // Coordenadas de textura padrão do Three.js
varying vec3 vPosition;

vec4 posterize(vec4 color, float levels) {
    vec4 scaledColor = color * levels;

    vec4 roundedColor = floor(scaledColor);

    vec4 posterizedColor = roundedColor / levels;

    return posterizedColor;
}

void main() {
    float depth = vPosition.y;
    vec4 texColor = texture2D(uTexture, vUv); // Amostra a textura
    vec4 poster = posterize(texColor, uPosterizeValue);

    gl_FragColor = poster;
}