uniform sampler2D uTexture;

varying vec2 vUv;
varying vec3 vPosition;

void main() {
    float depth = vPosition.y;
    vec4 texColor = texture2D(uTexture, vUv);
    gl_FragColor = texColor;
}