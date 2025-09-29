<script lang="ts">
    import { Icon } from "svelte-awesome";
    import { addressBook, gear } from "svelte-awesome/icons";
    import FloatingWindow from "../components/FloatingWindow.svelte";
    
    import {text_localized} from "../lib/index";

</script>

<div class="flex flex-col w-fit h-fit justify-center items-center gap-3 ml-auto mr-auto mt-[1.5%]">
    <section class="flex flex-row gap-4">
        <div class="flex flex-1 flex-nowrap">
            <FloatingWindow 
            width="40" 
            height="21" 
            placement=" " 
            position=" "
            child={aboutMe}
            />
        </div>
        <div class="flex flex-col flex-1 flex-wrap gap-5">
            <FloatingWindow 
            width="19" 
            height="21" 
            placement=" " 
            position=" "
            child={abilityTree}
            />
        </div>
    </section>
</div>

{#snippet aboutMe()}
    <article class="h-full w-full m-4 flex flex-col gap-6">
        <div class="w-full flex flex-row gap-2 items-center">
            <div class="w-10 h-10 bg-[var(--Primary-color)] p-3 rounded-4xl flex items-center">
                <Icon data={addressBook} scale={1.3}/>
            </div>
            <h4 class="text-xl text-bold">
                {text_localized["text"]["main_curriculum"]}
            </h4>
        </div>
        <p class="w-[600px] h-fit text-lg">
            {text_localized["text"]["main_curriculum_text"]}
        </p>
    </article>
{/snippet}

{#snippet abilityTree()}
    <article class="h-full w-full m-4 flex flex-col gap-6">
        <div class="w-full flex flex-row gap-2 items-center">
            <div class="w-10 h-10 bg-[var(--Primary-color)] p-3 rounded-4xl flex items-center">
                <Icon data={gear} scale={1.3}/>
            </div>
            <h4 class="text-white text-xl text-bold">
                {text_localized["text"]["secundary_curriculum"]}
            </h4>
        </div>
        <div class="w-full h-full flex flex-col gap-2">
            {@render programmingSkill("Python", 220)}
            {@render programmingSkill("C", 180)}
            {@render programmingSkill("Zig", 170)}
            {@render programmingSkill("JavaScript", 190)}
            {@render programmingSkill("Kotlin", 170)}
        </div>
    </article>
    {#snippet programmingSkill(name: string, size: number)}
        <div class="w-full h-fit flex flex-col">
            <p class="text-white">
                {name}
            </p>
            <div class="w-[250px] h-2 bg-white/25 rounded-2xl">
                <div class={`h-2 bg-[var(--Terciary-color)] rounded-2xl animate-programming_anim`} style={`width: ${size}px;`}></div>
            </div>
        </div>
    {/snippet}
{/snippet}