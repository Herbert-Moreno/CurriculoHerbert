<script lang="ts">
  import { T } from '@threlte/core';
  import { interactivity, OrbitControls } from '@threlte/extras';
  import Planet from '../components/Planet.svelte';
  import Stars from '../components/Stars.svelte';
  
  interactivity();
  let scale = $state(1.1);
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
  position = {[0.2,1.3,2.78]}
  onpointerenter={() => {
    scale = 1.3
  }}
  onpointerleave={() => {
    scale = 1.1
}}/>

<Stars/>