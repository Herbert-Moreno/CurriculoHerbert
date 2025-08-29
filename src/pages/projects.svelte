<script lang="ts">
    import FloatingWindow from "../components/FloatingWindow.svelte";
    import SpatialWindow from "../components/SpatialWindow.svelte";
    import ComputerScene from "./computerscene.svelte";
</script>

<div class="flex flex-col w-fit h-fit justify-center items-center gap-3 ml-auto mr-auto mt-[1.5%]">
    <section class="flex flex-row gap-4">
        <div class="flex flex-col flex-1 flex-wrap gap-5">
            <FloatingWindow 
            width="33" 
            height="24" 
            placement=" " 
            position=" "
            child={null}
            />
            <FloatingWindow 
            width="33" 
            height="4.75" 
            placement=" " 
            position=" "
            child={null}
            />
        </div>
        <div>
            <FloatingWindow 
            width="40" 
            height="30" 
            placement=" " 
            position=" "
            child={ProjectShowerScene}
            />
        </div>
    </section>
</div>

{#snippet ProjectShowerScene()}
    <SpatialWindow
        scene={scene}
    />
    {#snippet scene()}
        <ComputerScene/>
    {/snippet}
{/snippet}