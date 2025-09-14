<script lang="ts">
    import type { IconType } from "svelte-awesome/components/Icon.svelte";
    import { github, instagram, linkedin, whatsapp } from "svelte-awesome/icons";
    import Icon from 'svelte-awesome';
    import FloatingWindow from "../components/FloatingWindow.svelte";
    import SquareButton from "../components/SquareButton.svelte";
    import SpatialWindow from "../components/SpatialWindow.svelte";
    import SpaceScene from "./spacescene.svelte";

    import US_Json from '../lang/en_us.json';
    import ES_Json from '../lang/eu_es.json';
    import PT_Json from '../lang/pt_br.json';

    let page_locale = $state(navigator.language);
    let text_localized = $state();

    switch (page_locale) {
        case "en-US":
            text_localized = US_Json;
            break;
        case "eu-ES":
            text_localized = ES_Json;
            break;
        case "pt-BR":
            text_localized = PT_Json;
            break;
        default:
            text_localized = US_Json;
            break;
    }
    function goToSocialMedia(link: string) {
        window.location.href = link
    }

    let windowWidth = $state(0);
</script>

<svelte:window bind:innerWidth={windowWidth}/>

{#if windowWidth >= 1000}
    <section class="flex flex-row flex-nowrap gap-3 w-full h-fit justify-center items-center justify-self-center">
        <FloatingWindow 
        width="58" 
        height="32" 
        placement=" " 
        position=" "
        child={spacescene}
        />
        <div class="flex flex-col flex-nowrap gap-3 items-center">
            <FloatingWindow 
            width="20" 
            height="16.5" 
            placement=" " 
            position=" "
            child={Avatar}
            />
            <div class="flex flex-col flex-nowrap gap-3">
                <FloatingWindow 
                width="20" 
                height="4" 
                placement=" " 
                position=" "
                child={SocialMedia}
                />
                <FloatingWindow 
                width="20" 
                height="10" 
                placement=" " 
                position=" "
                child={Sklls}
                />
            </div>
        </div>
    </section>
{/if}

{#if windowWidth <= 999 && windowWidth >= 621}
    <section class="flex flex-row flex-wrap gap-3 w-full h-fit justify-center items-center justify-self-center">
        <FloatingWindow 
        width="40" 
        height="21" 
        placement=" " 
        position=" "
        child={spacescene}
        />
        <div class="flex gap-3 pb-6 items-center">
            <FloatingWindow 
            width="21" 
            height="19" 
            placement=" " 
            position=" "
            child={Avatar}
            />
            <div class="flex flex-col flex-nowrap gap-3">
                <FloatingWindow 
                width="18" 
                height="8" 
                placement=" " 
                position=" "
                child={SocialMedia}
                />
                <FloatingWindow 
                width="18" 
                height="10" 
                placement=" " 
                position=" "
                child={Sklls}
                />
            </div>
        </div>
    </section>
{/if}

{#if windowWidth <= 621 && windowWidth >= 280}
    <section class="flex flex-row flex-wrap gap-3 w-full h-fit justify-center items-center justify-self-center">
        <FloatingWindow 
        width="30" 
        height="17" 
        placement=" " 
        position=" "
        child={spacescene}
        />
        <div class="flex flex-col flex-wrap gap-3 pb-6 items-center">
            <FloatingWindow 
            width="30" 
            height="18" 
            placement=" " 
            position=" "
            child={Avatar}
            />
            <div class="flex flex-col flex-wrap gap-3">
                <FloatingWindow 
                width="30" 
                height="5" 
                placement=" " 
                position=" "
                child={SocialMedia}
                />
                <FloatingWindow 
                width="30" 
                height="8" 
                placement=" " 
                position=" "
                child={Sklls}
                />
            </div>
        </div>
    </section>
{/if}

{#snippet Avatar()}
    <div class="justify-self-center">
        <!-- svelte-ignore a11y_img_redundant_alt -->
        <img 
        src={`${import.meta.env.BASE_URL}ProfilePic.png`} 
        alt="Profile Picture"
        class="w-56"
        />
    </div>
{/snippet}

{#snippet Sklls()}
    <div class="w-full flex flex-row flex-wrap gap-9 max-md:gap-8 justify-center">
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
    <div class="flex flex-row gap-6 h-full w-full justify-center items-center">
        <SquareButton icon={icons} iconProp={linkedin} onClick={()=>{goToSocialMedia("https://www.linkedin.com/in/jos%C3%A9-herbert-rodrigues-moreno-784274289/")}}/>
        <SquareButton icon={icons} iconProp={github} onClick={()=>{goToSocialMedia("https://github.com/Herbert-Moreno")}}/>
        <SquareButton icon={icons} iconProp={whatsapp} onClick={()=>{goToSocialMedia("https://api.whatsapp.com/send?phone=5588920003887")}}/>
        <SquareButton icon={icons} iconProp={instagram} onClick={()=>{goToSocialMedia("https://www.instagram.com/herbert_xdr/")}}/>
    </div>
    {#snippet icons(icon: IconType)}
        <Icon data={icon} scale={1.6}></Icon>
    {/snippet}
{/snippet}

{#snippet spacescene()}
    <div>
        <SpatialWindow 
            scene={scene}
        />
        <div class="absolute flex flex-col text-center gap-3 max-md:gap-1 top-[35%] left-[56.5%]">
            <h1 class="text-white text-5xl max-lg:text-3xl max-sm:text-2xl select-none">José Herbert<br>
            Rodrigues Moreno</h1>
            <h4 class="text-[var(--Terciary-color)] text-2xl max-lg:text-sm select-none">{text_localized["text"]["main_title"]}</h4>
        </div>
    </div>
    {#snippet scene()}
        <SpaceScene/>
    {/snippet}
{/snippet}