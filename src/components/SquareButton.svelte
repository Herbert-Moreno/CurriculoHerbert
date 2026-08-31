<script lang="ts">
    import Icon from "svelte-awesome/components/Icon.svelte";

    let {
        icon = null,
        icon_Scale = 1.8,
        oneClick = false,
        size = "3",
        onClick = ()=>{},
    } = $props();

    let clicked = $state(false);
    
    function clickedOneTime() {
        clicked = true;
    }
</script>

{#if oneClick}
    <button class={`w-fit h-fit bg-[var(--Secundary-color)] text-white hover:bg-[var(--Secundary-color)] hover:text-[var(--Terciary-color)] border-none shadow-none rounded-xl object-center justify-content-center z-2`}
        onclick={()=>{clickedOneTime(); onClick();}}
        disabled={clicked}>
        {#if clicked}
            <div class="items-center justify-center">
                <span class="loading loading-spinner"> </span>
            </div>
        {/if}
    </button>
{/if}

{#if !oneClick}
    <button class={`w-fit h-fit p-2 bg-[var(--Terciary-color)] text-white hover:bg-[var(--Secundary-color)] hover:text-[var(--Terciary-color)] border-none shadow-none rounded-xl object-center justify-content-center z-2`}
        onclick={()=>{onClick();}}>
        <div class="items-center justify-center">
            <Icon data={icon} scale={icon_Scale}></Icon>
        </div>
    </button>
{/if}