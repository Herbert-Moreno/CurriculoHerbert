<script lang="ts">
    import { T } from '@threlte/core';
    import { OrbitControls } from '@threlte/extras';
    import Computer from '../components/Computer.svelte';
</script>

<T.AmbientLight 
    color="white"
/>
<T.Group
    position={[0.1, -1, 0.82]}
    rotation={[30.2, 40.856, 0]}>
    <Computer/>
</T.Group>

<T.PerspectiveCamera
    makeDefault
    position={[0, 3.7, 0]}>
    <OrbitControls
        enableRotate={false}
    />
</T.PerspectiveCamera>