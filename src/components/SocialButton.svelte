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
    <button class={`btn btn-square bg-[var(--Terciary-color)] hover:bg-[var(--Secundary-color)] text-[var(--Secundary-color)] hover:text-[var(--Terciary-color)] rounded-xl object-center z-2`}
        onclick={()=>{clickedOneTime(); onClick();}}
        disabled={clicked}>
        {#if clicked}
            <div class="card-body items-center justify-center">
                <span class="loading loading-spinner"> </span>
            </div>
        {/if}
    </button>
{/if}

{#if !oneClick}
    <button class={`btn btn-square bg-[var(--Terciary-color)] hover:bg-[var(--Secundary-color)] text-[var(--Secundary-color)] hover:text-[var(--Terciary-color)] rounded-xl object-center z-2 hover</button>`}
        onclick={()=>{onClick();}}>
        <div class="card-body items-center justify-center">
            {#if icon}
                {@render icon(iconProp)}
            {/if}
        </div>
    </button>
{/if}