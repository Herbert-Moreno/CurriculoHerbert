<script lang="ts">
    import { global_page } from '$lib';
    import type { IconType } from 'svelte-awesome/components/Icon.svelte';
    import Icon from 'svelte-awesome/components/Icon.svelte';

    let current_page = $derived($global_page);

    let {
        children = [],
    } = $props();
</script>

<header class="top-0 z-52 h-[3.5rem] max-lg:h-18 w-fit pr-7 pl-7 rounded-2xl bg-[var(--Secundary-color)] shadow-lg mt-[3.5%] flex flex-row gap-11 justify-center items-center justify-self-center mb-12">
    {#each children as child}
        {#if current_page == child.page}
            {@render ChangePageButton?.(child, true)}
        {/if}
        {#if current_page != child.page}
            {@render ChangePageButton?.(child, false)}
        {/if}
    {/each}
</header>

{#snippet ChangePageButton(child: any, active: boolean)}
    {#if active}
        <button
            class="w-[3rem] h-[3rem] max-lg:w-[3.2rem] max-lg:h-[3.2rem] bg-[var(--Terciary-color)] text-white border-none shadow-none rounded-4xl object-center z-2 transition-all duration-300 ease-in-out animate-page_header"
            disabled={true}>
            {@render icons?.(child.icon)}
        </button>
    {/if}
    {#if !active}
        <button
            onclick={()=>{global_page.set(child.page); console.log($global_page)}} 
            class="w-[3rem] h-[3rem] bg-[var(--Secundary-color)] text-[var(--Terciary-color)] border-none shadow-none rounded-4xl object-center z-2 transition delay-150 duration-300 ease-in-out hover:-translate-y-1 hover:scale-110">
            {@render icons?.(child.icon)}
        </button>
    {/if}
    {#snippet icons(icon: IconType)}
        <Icon data={icon} scale={1.8}></Icon>
    {/snippet}
{/snippet}