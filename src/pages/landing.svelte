<script lang="ts">
    import type { IconType } from "svelte-awesome/components/Icon.svelte";
    import { github, instagram, linkedin, whatsapp } from "svelte-awesome/icons";
    import Icon from 'svelte-awesome';
    import FloatingWindow from "../components/FloatingWindow.svelte";
    import SquareButton from "../components/SquareButton.svelte";
    import SpatialWindow from "../components/SpatialWindow.svelte";
    import SpaceScene from "./spacescene.svelte";

    function goToSocialMedia(link: string) {
        window.location.href = link
    }
</script>

<div class="flex flex-col w-fit h-fit justify-center items-center gap-3 ml-auto mr-auto mt-[1.5%]">
    <section class="flex flex-row gap-4">
        <div class="flex flex-1 flex-nowrap">
            <FloatingWindow 
            width="58" 
            height="33.5" 
            placement=" " 
            position=" "
            child={spacescene}
            />
        </div>
        <div class="flex flex-col flex-1 flex-wrap gap-5">
            <FloatingWindow 
            width="20" 
            height="19" 
            placement=" " 
            position=" "
            child={Avatar}
            />
            <FloatingWindow 
            width="20" 
            height="4" 
            placement=" " 
            position=" "
            child={SocialMedia}
            />
            <FloatingWindow 
            width="20" 
            height="8" 
            placement=" " 
            position=" "
            child={Sklls}
            />
        </div>
    </section>
</div>

{#snippet Avatar()}
    <div>
        
    </div>
{/snippet}

{#snippet Sklls()}
    <div class="w-full grid grid-cols-3 gap-2 justify-items-center">
        <a href="https://www.c-language.org/">
            <img class="w-max h-max" src="https://skillicons.dev/icons?i=c" alt="skill icons"/>
        </a>
        <a href="https://ziglang.org/">
            <img class="w-max h-max" src="https://skillicons.dev/icons?i=zig" alt="skill icons"/>
        </a>
        <a href="https://www.python.org/">
            <img class="w-max h-max" src="https://skillicons.dev/icons?i=python" alt="skill icons"/>
        </a>
        <a href="https://react.dev/">
            <img class="w-max h-max" src="https://skillicons.dev/icons?i=react" alt="skill icons"/>
        </a>
        <a href="https://svelte.dev/">
            <img class="w-max h-max" src="https://skillicons.dev/icons?i=svelte" alt="skill icons"/>
        </a>
        <a href="https://flutter.dev/">
            <img class="w-max h-max" src="https://skillicons.dev/icons?i=flutter" alt="skill icons"/>
        </a>
    </div>
{/snippet}

{#snippet SocialMedia()}
    <div class="flex flex-row gap-6 h-full w-full justify-center">
        <SquareButton icon={icons} iconProp={linkedin} onClick={()=>{goToSocialMedia("https://www.linkedin.com/in/jos%C3%A9-herbert-rodrigues-moreno-784274289/")}}/>
        <SquareButton icon={icons} iconProp={github} onClick={()=>{goToSocialMedia("https://github.com/Herbert-Moreno")}}/>
        <SquareButton icon={icons} iconProp={whatsapp} onClick={()=>{goToSocialMedia("https://api.whatsapp.com/send?phone=5588920003887")}}/>
        <SquareButton icon={icons} iconProp={instagram} onClick={()=>{goToSocialMedia("https://www.instagram.com/herbert_xdr/")}}/>
    </div>
    {#snippet icons(icon: IconType)}
        <Icon data={icon} scale={2}></Icon>
    {/snippet}
{/snippet}

{#snippet spacescene()}
    <div>
        <SpatialWindow 
            scene={scene}
        />
        <div class="absolute flex flex-col text-center gap-4 top-[35%] left-[56.5%]">
            <h1 class="text-white text-5xl select-none">José Herbert<br>
            Rodrigues Moreno</h1>
            <h4 class="text-[var(--Terciary-color)] text-2xl select-none">Web & App Developer</h4>
        </div>
    </div>
    {#snippet scene()}
        <SpaceScene/>
    {/snippet}
{/snippet}