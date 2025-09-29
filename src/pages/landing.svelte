<script lang="ts">
    import type { IconType } from "svelte-awesome/components/Icon.svelte";
    import { github, instagram, linkedin, whatsapp } from "svelte-awesome/icons";
    import Icon from 'svelte-awesome';
    import FloatingWindow from "../components/FloatingWindow.svelte";
    import SquareButton from "../components/SquareButton.svelte";
    import SpatialWindow from "../components/SpatialWindow.svelte";
    import SpaceScene from "./spacescene.svelte";
    import SkillIcon from "../components/SkillIcon.svelte";
    import { text_localized } from "../lib/index";
 
    function goToSocialMedia(link: string) {
        window.location.href = link
    }

    let windowWidth = $state(0);

    let scale = $state(1);

    $effect(()=>{scale = Math.min(1, windowWidth / 1440);})
</script>

<svelte:window bind:innerWidth={windowWidth}/>

{#if windowWidth >= 1110}
    <section class="flex flex-row flex-nowrap gap-3 w-full h-fit justify-center items-center justify-self-center">
        <FloatingWindow 
        width={920 * scale}
        height={520 * scale} 
        placement=" " 
        position=" "
        child={spacescene}
        />
        <div class="flex flex-col flex-nowrap gap-3 items-center">
            <FloatingWindow 
            width={300 * scale} 
            height={260 * scale} 
            placement=" " 
            position=" "
            child={Avatar}
            />
            <div class="flex flex-col flex-nowrap gap-3">
                <FloatingWindow 
                width={300 * scale} 
                height={65 * scale} 
                placement=" " 
                position=" "
                child={SocialMedia}
                />
                <FloatingWindow 
                width={300 * scale} 
                height={160 * scale} 
                placement=" " 
                position=" "
                child={Sklls}
                />
            </div>
        </div>
    </section>
{/if}

{#if windowWidth < 1110 && windowWidth > 632}
    <section class="flex flex-col flex-nowrap gap-3 w-full h-fit justify-center items-center justify-self-center">
        <FloatingWindow 
        width={(920 * 1.2) * scale}
        height={(520 * 1.2) * scale} 
        placement=" " 
        position=" "
        child={spacescene}
        />
        <div class="flex flex-row flex-nowrap gap-3 items-center">
            <FloatingWindow 
            width={(350 * 1.2) * scale} 
            height={(300 * 1.2) * scale} 
            placement=" " 
            position=" "
            child={Avatar}
            />
            <div class="flex flex-col flex-nowrap gap-3">
                <FloatingWindow 
                width={(350 * 1.2) * scale} 
                height={(100.5 * 1.2) * scale} 
                placement=" " 
                position=" "
                child={SocialMedia}
                />
                <FloatingWindow 
                width={(350 * 1.2) * scale} 
                height={(197.5 * 1.2) * scale} 
                placement=" " 
                position=" "
                child={Sklls}
                />
            </div>
        </div>
    </section>
{/if}

{#if windowWidth <= 632 && windowWidth >= 320}
    <section class="flex flex-col flex-nowrap gap-3 w-full h-fit justify-center items-center justify-self-center">
        <FloatingWindow 
        width={(920 * 1.54) * scale}
        height={(520 * 1.54) * scale} 
        placement=" " 
        position=" "
        child={spacescene}
        />
        <FloatingWindow 
        width={(920 * 1.54) * scale}
        height={(600 * 1.54) * scale} 
        placement=" " 
        position=" "
        child={Avatar}
        />
        <FloatingWindow 
        width={(920 * 1.54) * scale}
        height={(200 * 1.54) * scale} 
        placement=" " 
        position=" "
        child={SocialMedia}
        />
        <FloatingWindow 
        width={(920 * 1.54) * scale}
        height={(400 * 1.54) * scale} 
        placement=" " 
        position=" "
        child={Sklls}
        />
    </section>
{/if}

{#snippet Avatar()}
    {#if windowWidth > 375}
        <div class="justify-self-center">
            <!-- svelte-ignore a11y_img_redundant_alt -->
            <img 
            src={`${import.meta.env.BASE_URL}ProfilePic.png`} 
            alt="Profile Picture"
            class="w-full h-full"
            />
        </div>
    {/if}
    {#if windowWidth <= 375}
        <div class="justify-self-center">
            <!-- svelte-ignore a11y_img_redundant_alt -->
            <img 
            src={`${import.meta.env.BASE_URL}ProfilePic.png`} 
            alt="Profile Picture"
            class="w-52"
            />
        </div>
    {/if}
{/snippet}

{#snippet Sklls()}
    <div class="flex flex-row flex-wrap gap-8 max-sm:gap-10 justify-center items-center">
        <SkillIcon 
        href="https://www.c-language.org/"
        icon="c"
        />
        <SkillIcon 
        href="https://ziglang.org/"
        icon="zig"
        />
        <SkillIcon 
        href="https://www.python.org/"
        icon="python"
        />
        <SkillIcon 
        href="https://react.dev/"
        icon="react"
        />
        <SkillIcon 
        href="https://svelte.dev/"
        icon="svelte"
        />
        <SkillIcon 
        href="https://kotlinlang.org/"
        icon="kotlin"
        />
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
    <div class="absolute w-full h-full top-0 left-0 p-3">
        <SpatialWindow 
            scene={scene}
        />
    </div>
    <div 
    class="w-full flex flex-col text-center gap-3 max-md:gap-1"
    style="align-items: end;"
    >
        {#if windowWidth >= 1110}
            <h1 class="text-white text-[42px] select-none">José Herbert<br>
            Rodrigues Moreno</h1>
            <h4 class="text-[var(--Terciary-color)] text-[24px] select-none mr-5">{text_localized["text"]["main_title"]}</h4>
        {/if}
        {#if windowWidth < 1110 && windowWidth >= 814}
            <h1 class="text-white text-[35px] select-none">José Herbert<br>
            Rodrigues Moreno</h1>
            <h4 class="text-[var(--Terciary-color)] text-[19px] select-none mr-5">{text_localized["text"]["main_title"]}</h4>
        {/if}
        {#if windowWidth < 814 && windowWidth >= 470}
            <h1 class="text-white text-[28px] select-none">José Herbert<br>
            Rodrigues Moreno</h1>
            <h4 class="text-[var(--Terciary-color)] text-[15px] select-none mr-5">{text_localized["text"]["main_title"]}</h4>
        {/if}
        {#if windowWidth < 470 && windowWidth >= 375}
            <h1 class="text-white text-[22px] select-none">José Herbert<br>
            Rodrigues Moreno</h1>
            <h4 class="text-[var(--Terciary-color)] text-[12px] select-none mr-5">{text_localized["text"]["main_title"]}</h4>
        {/if}
        {#if windowWidth < 375 && windowWidth >= 320}
            <h1 class="text-white text-[18px] select-none">José Herbert<br>
            Rodrigues Moreno</h1>
            <h4 class="text-[var(--Terciary-color)] text-[8px] select-none mr-5">{text_localized["text"]["main_title"]}</h4>
        {/if}
    </div>
    {#snippet scene()}
        <SpaceScene/>
    {/snippet}
{/snippet}