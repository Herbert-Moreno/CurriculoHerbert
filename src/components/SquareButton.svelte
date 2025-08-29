<script lang="ts">
    let {
        icon = null,
        iconProp = null,
        oneClick = false,
        onClick = ()=>{},
    } = $props();

    let clicked = $state(false);
    
    function clickedOneTime() {
        clicked = true;
    }
</script>

{#if oneClick}
    <button class={`w-[2.8rem] h-[2.8rem] bg-[var(--Secundary-color)] text-white hover:bg-[var(--Secundary-color)] hover:text-[var(--Terciary-color)] border-none shadow-none rounded-xl object-center justify-content-center z-2`}
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
    <button class={`w-[2.8rem] h-[2.8rem] bg-[var(--Terciary-color)] text-white hover:bg-[var(--Secundary-color)] hover:text-[var(--Terciary-color)] border-none shadow-none rounded-xl object-center justify-content-center z-2`}
        onclick={()=>{onClick();}}>
        <div class="items-center justify-center">
            {#if icon}
                {@render icon(iconProp)}
            {/if}
        </div>
    </button>
{/if}