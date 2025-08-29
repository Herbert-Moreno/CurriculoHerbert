<script lang="ts">
    import { global_page } from "$lib";
    import Landing from "../pages/landing.svelte";
    import Projects from "../pages/projects.svelte";
    import Curriculum from "../pages/curriculum.svelte";
    let current_page = $derived($global_page);
</script>

<div>
    {#if current_page == "landing"}
        <Landing/>
    {/if}
    {#if current_page == "projects"}
        <Projects/>
    {/if}
    {#if current_page == "curriculum"}
        <Curriculum/>
    {/if}
</div>