<script lang="ts">
    let {
        children = [],
    } = $props();
</script>

<header class="z-52 h-[3.5rem] w-[79rem] transform-x-1/2 rounded-2xl bg-[var(--Secundary-color)] shadow-lg">
    {#each children as child}
        {@render child()}
    {/each}
</header>