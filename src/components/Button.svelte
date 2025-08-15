<script lang="ts">
    let { 
        size = "md",
        child = null,
        childProps = {},
        oneClick = false,
        onClick = ()=>{},
    } = $props();

    let clicked = $state(false);
    
    function clickedOneTime() {
        clicked = true;
    }
</script>

{#if oneClick}
    <button class={`btn btn-${size} bg-[var(--Terciary-color)] rounded-xl object-center z-2`}
        onclick={()=>{clickedOneTime(); onClick()}}
        disabled={clicked}>
        {#if clicked}
            <div class="card-body items-center justify-center">
                <span class="loading loading-spinner"> </span>
            </div>
        {/if}
    </button>
{/if}

{#if !oneClick}
    <button class={`btn btn-${size} bg-[var(--Terciary-color)] rounded-xl object-center z-2`}
        onclick={()=>{clickedOneTime(); onClick()}}>
        <div class="card-body items-center justify-center">
            {#if child}
                {@render child(childProps)}
            {/if}
        </div>
    </button>
{/if}