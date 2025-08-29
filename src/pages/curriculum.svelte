<script lang="ts">
    import FloatingWindow from "../components/FloatingWindow.svelte";
</script>

<div class="flex flex-col w-fit h-fit justify-center items-center gap-3 ml-auto mr-auto mt-[1.5%]">
    <section class="flex flex-row gap-4">
        <div class="flex flex-1 flex-nowrap">
            <FloatingWindow 
            width="58" 
            height="33.5" 
            placement=" " 
            position=" "
            child={null}
            />
        </div>
        <div class="flex flex-col flex-1 flex-wrap gap-5">
            <FloatingWindow 
            width="20" 
            height="8" 
            placement=" " 
            position=" "
            child={null}
            />
        </div>
    </section>
</div>
