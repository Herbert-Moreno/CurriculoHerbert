<script>
  import { T } from '@threlte/core';
  import { FakeGlowMaterial, interactivity, MeshLineMaterial, OrbitControls } from '@threlte/extras'
  
  interactivity();
  let scale = $state(1);
</script>

<T.PerspectiveCamera
  makeDefault
  position={[5, 5, 5]}
>
  <OrbitControls />
</T.PerspectiveCamera>
<T.Mesh
  scale = {scale}
  onpointerenter={() => {
    scale = 2
  }}
  onpointerleave={() => {
    scale = 1
  }}
>
  <T.BoxGeometry/>
  <T.MeshBasicMaterial/>
</T.Mesh>