<script lang="ts">
    let {
        href = "",
        icon = "c",
    } = $props();
        
    let windowWidth = $state(0);

    let scale = $state(1);

    $effect(()=>{scale = Math.min(1, windowWidth / 1440);})
</script>

<svelte:window bind:innerWidth={windowWidth}/>

{#if windowWidth >= 1110}
    <a href={href}>
        <img 
        style="
        width: {48*scale}px;
        height: {48*scale}px;
        "
        src="https://skills.syvixor.com/api/icons?i={icon}" 
        alt="skill icons"/>
    </a>
{/if}

{#if windowWidth < 1110 && windowWidth >= 632}
    <a href={href}>
        <img 
        style="
        width: {(48*1.2)*scale}px;
        height: {(48*1.2)*scale}px;
        "
        src="https://skills.syvixor.com/api/icons?i={icon}" 
        alt="skill icons"/>
    </a>
{/if}

{#if windowWidth < 632 && windowWidth >= 320}
    <a href={href}>
        <img 
        style="
        width: {(48*4)*scale}px;
        height: {(48*4)*scale}px;
        "
        src="https://skills.syvixor.com/api/icons?i={icon}" 
        alt="skill icons"/>
    </a>
{/if}