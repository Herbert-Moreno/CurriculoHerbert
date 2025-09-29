<script lang="ts">
    import { arrowLeft, arrowRight } from "svelte-awesome/icons";
    import Icon from 'svelte-awesome';
    import { type IconType } from "svelte-awesome/components/Icon.svelte";

    import FloatingWindow from "../components/FloatingWindow.svelte";
    import SpatialWindow from "../components/SpatialWindow.svelte";
    import ComputerScene from "./computerscene.svelte";
    import SquareButton from "../components/SquareButton.svelte";
    import { text_localized } from "../lib/index";

    let current_project = $state(0);
    let projects_json = $derived(text_localized);

    function Change_Project(change_type: string) {
        if (change_type == "decrease") {
            current_project -= 1;
            if (current_project < 0) {
                current_project = (projects_json["projects"].length - 1);
            } 
        } else if (change_type == "increase") {
            current_project += 1;
            if (current_project > (projects_json["projects"].length - 1)) {
                current_project = 0;
            } 
        }
    }

    let windowWidth = $state(0);

    let scale = $state(1);

    $effect(()=>{scale = Math.min(1, windowWidth / 1440);})
</script>

<svelte:window bind:innerWidth={windowWidth}/>

{#if windowWidth >= 1110}
    <section class="flex flex-nowrap flex-row w-fit h-fit gap-5 justify-center items-center justify-self-center mb-4">
        <div class="flex flex-col flex-1 flex-wrap gap-5">
            <FloatingWindow 
            width={530 * scale} 
            height={400 * scale} 
            placement=" " 
            position=" "
            child={ProjectInfo}
            />
            <FloatingWindow 
            width={530 * scale} 
            height={70 * scale} 
            placement=" " 
            position=" "
            child={StackAndSkip}
            />
        </div>
        <FloatingWindow 
        width={530 * scale} 
        height={495 * scale} 
        placement=" " 
        position=" "
        child={ProjectShowerScene}
        />
    </section>
{/if}
{#if windowWidth < 1110 && windowWidth > 790}
    <section class="flex flex-nowrap flex-row w-fit h-fit gap-5 justify-center items-center justify-self-center mb-4">
        <div class="flex flex-col flex-1 flex-wrap gap-5">
            <FloatingWindow 
            width={(530 * 1.2) * scale} 
            height={(400 * 1.2) * scale} 
            placement=" " 
            position=" "
            child={ProjectInfo}
            />
            <FloatingWindow 
            width={(530 * 1.2) * scale} 
            height={(70 * 1.2) * scale} 
            placement=" " 
            position=" "
            child={StackAndSkip}
            />
        </div>
        <FloatingWindow 
        width={(530 * 1.2) * scale} 
        height={(495 * 1.2) * scale} 
        placement=" " 
        position=" "
        child={ProjectShowerScene}
        />
    </section>
{/if}
{#if windowWidth <= 769 && windowWidth > 426}
    <section class="flex flex-nowrap flex-col w-fit h-fit gap-5 justify-center items-center justify-self-center mb-4">
        <FloatingWindow 
        width={(530 * 2) * scale} 
        height={(495 * 2) * scale} 
        placement=" " 
        position=" "
        child={ProjectShowerScene}
        />
        <FloatingWindow 
        width={(530 * 2) * scale} 
        height={(400 * 2) * scale} 
        placement=" " 
        position=" "
        child={ProjectInfo}
        />
        <FloatingWindow 
        width={(530 * 2) * scale} 
        height={(70 * 2) * scale} 
        placement=" " 
        position=" "
        child={StackAndSkip}
        />
    </section>
{/if}
{#if windowWidth <= 426 && windowWidth > 310}
    <section class="flex flex-nowrap flex-col w-fit h-fit gap-5 justify-center items-center justify-self-center mb-4">
        <FloatingWindow 
        width={(530 * 2.5) * scale} 
        height={(495 * 2.5) * scale} 
        placement=" " 
        position=" "
        child={ProjectShowerScene}
        />
        <FloatingWindow 
        width={(530 * 2.6) * scale} 
        height={(400 * 2.6) * scale} 
        placement=" " 
        position=" "
        child={ProjectInfo}
        />
        <FloatingWindow 
        width={(530 * 2.5) * scale} 
        height={(90 * 2.5) * scale} 
        placement=" " 
        position=" "
        child={StackAndSkip}
        />
    </section>
{/if}

{#snippet ProjectShowerScene()}
    <SpatialWindow
        scene={scene}
    />
    {#snippet scene()}
        <ComputerScene projectTexture={projects_json["projects"][current_project]["texture"]}/>
    {/snippet}
{/snippet}

{#snippet StackAndSkip()}
    <div class="w-full flex flex-row gap-2 items-center">
        <div class="w-full flex justify-start">
            <SquareButton icon={icons} iconProp={arrowLeft} onClick={()=>{Change_Project("decrease")}}/>
        </div>
        <div class="w-full h-full flex justify-center gap-3">
            {@render CreateStack()}
        </div>
        <div class="w-full flex justify-end">
            <SquareButton icon={icons} iconProp={arrowRight} onClick={()=>{Change_Project("increase")}}/>
        </div>
    </div>
    {#snippet CreateStack()}
        {#each projects_json["projects"][current_project]["tech_stack"] as stack}
            {#if windowWidth >= 1023}
                <img 
                style="
                width: {48*scale}px;
                height: {48*scale}px;
                "
                src="https://skills.syvixor.com/api/icons?i={stack}" 
                alt="skill icons"
                />
            {/if}
            {#if windowWidth <= 769 && windowWidth > 426}
                <img 
                style="
                width: {(48 * 2)*scale}px;
                height: {(48 * 2)*scale}px;
                "
                src="https://skills.syvixor.com/api/icons?i={stack}" 
                alt="skill icons"
                />
            {/if}
            {#if windowWidth <= 426 && windowWidth >= 319}
                <img 
                style="
                width: {(48 * 2.5)*scale}px;
                height: {(48 * 2.5)*scale}px;
                "
                src="https://skills.syvixor.com/api/icons?i={stack}" 
                alt="skill icons"
                />
            {/if}
        {/each}
    {/snippet}
        {#snippet icons(icon: IconType)}
        <Icon data={icon} scale={2}></Icon>
    {/snippet}
{/snippet}

{#snippet ProjectInfo()}
    <section class="w-full h-fit flex flex-col gap-3 p-2">
        {#if windowWidth < 325}
            <div class="absolute top-12 left-36 text-end text-sm text-white/50">
                <a href={projects_json["projects"][current_project]["project_url"]}>
                    {projects_json["text"]["project_link_text"]}
                </a>
            </div>
        {/if}
        <img class="w-18 h-18" src={projects_json["projects"][current_project]["icon_url"]} alt="Project Icon">
        <div class="w-full flex flex-row justify-between text-bold items-end">
            {#if windowWidth >= 1110}
                <h1 class="text-white text-[32px] select-none">{projects_json["projects"][current_project]["name"]}</h1>
                <p class="text-white text-md">Version: {projects_json["projects"][current_project]["version"]}</p>
            {/if}
            {#if windowWidth <= 1024 && windowWidth > 428}
                <h1 class="text-white text-[32px] select-none">{projects_json["projects"][current_project]["name"]}</h1>
                <p class="text-white text-md">Version: {projects_json["projects"][current_project]["version"]}</p>
            {/if}
            {#if windowWidth <= 426 && windowWidth > 310}
                <h1 class="text-white text-[20px] select-none">{projects_json["projects"][current_project]["name"]}</h1>
                <p class="text-white text-sm">Version: {projects_json["projects"][current_project]["version"]}</p>
            {/if}
        </div>
        {#if windowWidth >= 1110}
            <p class="text-white text-md">
                {projects_json["projects"][current_project]["description"]}
            </p>
        {/if}
        {#if windowWidth <= 1024 && windowWidth > 428}
            <p class="text-white text-sm">
                {projects_json["projects"][current_project]["description"]}
            </p>
        {/if}
        {#if windowWidth <= 426 && windowWidth > 310}
            <p class="text-white text-[9px]">
                {projects_json["projects"][current_project]["description"]}
            </p>
        {/if}
    </section>
    <br>
    {#if windowWidth > 325}
        <div class="w-full h-fit pb-2 text-end text-sm text-white/50">
            <a href={projects_json["projects"][current_project]["project_url"]}>
                {projects_json["text"]["project_link_text"]}
            </a>
        </div>
    {/if}
{/snippet}