<script>
    import { Canvas } from '@threlte/core'
    import Spacescene from '../pages/spacescene.svelte';

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