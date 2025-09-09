<script lang="ts">
    import { T } from '@threlte/core';
    import { OrbitControls } from '@threlte/extras';
    import Computer from '../components/Computer.svelte';
</script>

<T.AmbientLight 
    color="white"
/>
<T.Group
    position={[0.0, -0.8, 0.0]}>
    <Computer/>
</T.Group>

<T.PerspectiveCamera
    makeDefault
    position={[0.35, 2.5, -5]}>
    <OrbitControls
        enablePan={false}
        minPolarAngle={0}
        maxPolarAngle={Math.PI/2}/>
</T.PerspectiveCamera>