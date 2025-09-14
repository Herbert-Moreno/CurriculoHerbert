<script lang="ts">
    let { 
        width = "24", 
        height = "24", 
        placement = "absolute", 
        position = "top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2",
        child,
        childProps = {}
    } = $props();

</script>

<div class={`card w-96 bg-[var(--Secundary-color)] rounded-xl justify-center z-2 ${placement} ${position}`}
    style="width: {width}rem; height: {height}rem;">
    <div class="w-full h-full p-3 justify-center items-center place-content-center-safe">
        {#if child}
            {@render child(childProps)}
        {/if}
    </div>
</div>