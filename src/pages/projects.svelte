<script lang="ts">
    import { arrowLeft, arrowRight } from "svelte-awesome/icons";
    import Icon from 'svelte-awesome';
    import FloatingWindow from "../components/FloatingWindow.svelte";
    import SpatialWindow from "../components/SpatialWindow.svelte";
    import ComputerScene from "./computerscene.svelte";
    import SquareButton from "../components/SquareButton.svelte";
    import { type IconType } from "svelte-awesome/components/Icon.svelte";

    let current_project = $state(0);
</script>

<div class="flex flex-col w-fit h-fit justify-center items-center gap-3 ml-auto mr-auto mt-[1.5%]">
    <section class="flex flex-row gap-4">
        <div class="flex flex-col flex-1 flex-wrap gap-5">
            <FloatingWindow 
            width="33" 
            height="24" 
            placement=" " 
            position=" "
            child={ProjectInfo}
            />
            <FloatingWindow 
            width="33" 
            height="4.75" 
            placement=" " 
            position=" "
            child={StackAndSkip}
            />
        </div>
        <div>
            <FloatingWindow 
            width="40" 
            height="30" 
            placement=" " 
            position=" "
            child={ProjectShowerScene}
            />
        </div>
    </section>
</div>

{#snippet ProjectShowerScene()}
    <SpatialWindow
        scene={scene}
    />
    {#snippet scene()}
        <ComputerScene/>
    {/snippet}
{/snippet}

{#snippet StackAndSkip()}
    <div class="w-full flex flex-row gap-2">
        <div class="w-full flex justify-start">
            <SquareButton icon={icons} iconProp={arrowLeft} onClick={()=>{}}/>
        </div>
        <div class="w-full flex justify-center gap-3">
            {@render CreateStack(["js", "svelte", "threejs"])}
        </div>
        <div class="w-full flex justify-end">
            <SquareButton icon={icons} iconProp={arrowRight} onClick={()=>{}}/>
        </div>
    </div>
    {#snippet CreateStack(tech_stack: Array<string>)}
        {#each tech_stack as icon}
            <a href="https://www.c-language.org/">
                <img class="w-max h-max" src={`https://skillicons.dev/icons?i=${icon}`} alt="skill icons"/>
            </a>
        {/each}
    {/snippet}
        {#snippet icons(icon: IconType)}
        <Icon data={icon} scale={2}></Icon>
    {/snippet}
{/snippet}

{#snippet ProjectInfo()}
    <section class="w-full h-full flex flex-col gap-2 m-3">
        <div class="w-full flex flex-row gap-4 text-bold text-xl">
            <h1>{"test"}</h1>
            <p>Version: {""}</p>
        </div>
        <br>
        <p>{"Desc:"}</p>
        <p>
            {""}
        </p>
    </section>
{/snippet}