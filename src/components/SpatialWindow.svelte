<script>
    import { Canvas } from '@threlte/core';
    
    let { 
        scene, 
        sceneProps = {}
        } = $props();
</script>

<Canvas>
    {#if scene}
        {@render scene(sceneProps)}
    {/if}
</Canvas>