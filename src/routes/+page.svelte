<script lang="ts">
    import Landing from "../pages/landing.svelte";
    import Projects from "../pages/projects.svelte";

    let current_page = $state("landing");

</script>

<div class="">
    {#if current_page == "landing"}
        <Landing></Landing>
    {/if}
    {#if current_page == "projects"}
        <Projects></Projects>
    {/if}
</div>

<style>
    
</style>