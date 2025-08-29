<script lang="ts">
  import { T } from '@threlte/core';
  import { interactivity, OrbitControls } from '@threlte/extras';
  import simpleFrag from '../shaders/SimpleFrag.glsl?raw';
  import simpleVert from '../shaders/SimpleVert.glsl?raw';
  import Planet from '../components/planet.svelte';
  
  interactivity();
  let scale = $state(1.3);
  let moon_scale = $state(0.2);
</script>

<T.PerspectiveCamera
  makeDefault
  position={[5, 5, 5]}
>
  <OrbitControls
    enableZoom={false}
    enablePan={false}
    enableRotate={true}
  />
</T.PerspectiveCamera>

<Planet 
  scale = {scale}
  position = {[0,1,3.2]}
  onpointerenter={() => {
    scale = 1.5
  }}
  onpointerleave={() => {
    scale = 1.3
  }}/>

<T.Mesh
  scale = {moon_scale}
  position = {[0,2,5]}
  onpointerenter={() => {
    moon_scale = 0.3
  }}
  onpointerleave={() => {
    moon_scale = 0.2
  }}
>
  <T.SphereGeometry attach="geometry"/>
  <T.ShaderMaterial
    fragmentShader={simpleFrag}
    vertexShader={simpleVert}
  />
</T.Mesh>