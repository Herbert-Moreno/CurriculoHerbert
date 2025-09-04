<script lang="ts">
    import SpatialWindow from "../../components/SpatialWindow.svelte";
    import SpaceScene from "../../pages/spacescene.svelte";
    import FloatingWindow from "../../components/FloatingWindow.svelte";
    export const prerender = true;

</script>

<div class="flex flex-1 flex-nowrap">
    <FloatingWindow 
    width="58" 
    height="33.5" 
    placement=" " 
    position=" "
    child={spacescene}
    />
</div>

{#snippet spacescene()}
    <div>
        <SpatialWindow 
            scene={scene}
        />
        <div class="absolute flex flex-col text-center gap-4 top-[35%] left-[56.5%]">
            <h1 class="text-white text-5xl select-none">José Herbert<br>
            Rodrigues Moreno</h1>
            <h4 class="text-[var(--Terciary-color)] text-2xl select-none">Web & App Developer</h4>
        </div>
    </div>
    {#snippet scene()}
        <SpaceScene/>
    {/snippet}
{/snippet}