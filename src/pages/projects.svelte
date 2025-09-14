<script lang="ts">
    import { arrowLeft, arrowRight } from "svelte-awesome/icons";
    import Icon from 'svelte-awesome';
    import { type IconType } from "svelte-awesome/components/Icon.svelte";

    import FloatingWindow from "../components/FloatingWindow.svelte";
    import SpatialWindow from "../components/SpatialWindow.svelte";
    import ComputerScene from "./computerscene.svelte";
    import SquareButton from "../components/SquareButton.svelte";

    import US_Json from '../lang/en_US.json';
    import ES_Json from '../lang/eu_ES.json';
    import PT_Json from '../lang/pt_BR.json';

    let page_locale = $state(navigator.language);
    let current_project = $state(0);
    type Project = {
        name: string;
        version: string;
        description: string;
        icon_url: string;
        project_url: string;
        tech_stack: string[];
        texture: object;
    };
    type ProjectsJson = {
        projects: Project[];
    };
    let projects_json = $state<ProjectsJson>();

    switch (page_locale) {
        case "en-US":
            projects_json = US_Json;
            break;
        case "eu-ES":
            projects_json = ES_Json;
            break;
        case "pt-BR":
            projects_json = PT_Json;
            break;
        default:
            projects_json = US_Json;
            break;
    }

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
</script>

<svelte:window bind:innerWidth={windowWidth}/>

{#if windowWidth >= 1000}
    <section class="flex flex-nowrap flex-row w-fit h-fit gap-5 justify-center items-center justify-self-center mb-4">
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
        <FloatingWindow 
        width="40" 
        height="30" 
        placement=" " 
        position=" "
        child={ProjectShowerScene}
        />
    </section>
{/if}

{#if windowWidth <= 999 && windowWidth >= 621}
    <section class="flex flex-wrap flex-col w-fit h-fit gap-5 justify-center items-center justify-self-center mb-4">
        <FloatingWindow 
        width="40" 
        height="24" 
        placement=" " 
        position=" "
        child={ProjectInfo}
        />
        <FloatingWindow 
        width="40" 
        height="4.75" 
        placement=" " 
        position=" "
        child={StackAndSkip}
        />
        <FloatingWindow 
        width="40" 
        height="30" 
        placement=" " 
        position=" "
        child={ProjectShowerScene}
        />
    </section>
{/if}

{#if windowWidth <= 621 && windowWidth >= 280}
    <section class="flex flex-wrap flex-col w-fit h-fit gap-5 justify-center items-center justify-self-center mb-4">
        <FloatingWindow 
        width="30" 
        height="24" 
        placement=" " 
        position=" "
        child={ProjectInfo}
        />
        <FloatingWindow 
        width="30" 
        height="4.75" 
        placement=" " 
        position=" "
        child={StackAndSkip}
        />
        <FloatingWindow 
        width="30" 
        height="30" 
        placement=" " 
        position=" "
        child={ProjectShowerScene}
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
    <div class="w-full flex flex-row gap-2">
        <div class="w-full flex justify-start">
            <SquareButton icon={icons} iconProp={arrowLeft} onClick={()=>{Change_Project("decrease")}}/>
        </div>
        <div class="w-full flex justify-center gap-3">
            {@render CreateStack()}
        </div>
        <div class="w-full flex justify-end">
            <SquareButton icon={icons} iconProp={arrowRight} onClick={()=>{Change_Project("increase")}}/>
        </div>
    </div>
    {#snippet CreateStack()}
        {#each projects_json["projects"][current_project]["tech_stack"] as stack}
            <img class="w-max h-max" src={`https://skills.syvixor.com/api/icons?i=${stack}`} alt="skill icons"/>
        {/each}
    {/snippet}
        {#snippet icons(icon: IconType)}
        <Icon data={icon} scale={2}></Icon>
    {/snippet}
{/snippet}

{#snippet ProjectInfo()}
    <section class="w-full h-fit flex flex-col gap-2 p-2">
        <img class="w-18 h-18" src={projects_json["projects"][current_project]["icon_url"]} alt="Project Icon">
        <div class="w-full flex flex-row justify-between text-bold items-end">
            <h1 class="text-3xl">{projects_json["projects"][current_project]["name"]}</h1>
            <p class="text-md">Version: {projects_json["projects"][current_project]["version"]}</p>
        </div>
        <br>
        <p>
            {projects_json["projects"][current_project]["description"]}
        </p>
    </section>
    <br>
    <div class="w-full h-fit p-2 text-end text-sm text-white/50">
        <a href={projects_json["projects"][current_project]["project_url"]}>
            {projects_json["text"]["project_link_text"]}
        </a>
    </div>
{/snippet}