<script lang="ts">
  import { text_localized } from "../lib/index";
  import SquareButton from "./SquareButton.svelte";
  import {github, instagram, linkedin, terminal } from "svelte-awesome/icons";
    import SkillIcon from "./SkillIcon.svelte";
    import Icon from "svelte-awesome/components/Icon.svelte";
    import Computer from "./Computer.svelte";

  function goToSocialMedia(link: string) {
    window.location.href = link
  }
</script>

<div class="flex flex-col flex-wrap items-center justify-center pt-34">
  <div class="w-full max-w-5xl h-72 bg-[#241075] rounded-xl p-4 text-white shadow-lg">
    <div class="flex flex-row flex-wrap w-full h-full gap-8 justify-center align-middle items-center">
      <img class="h-52" src="/ProfilePic.png" alt="Foto de perfil"/>
      <div 
        class="w-fit h-full flex flex-col text-center gap-2 justify-center align-middle items-center">
        <h1 class="text-white text-3xl select-none font-extrabold">José Herbert Rodrigues Moreno</h1>
        <h4 class="text-[var(--Terciary-color)] text-md select-none mr-5">{text_localized["text"]["main_title"]}</h4>
        {@render SocialMedia()}
      </div>
    </div>
  </div>
  <div class="w-full mt-3 max-w-5xl h-18 bg-[#241075] rounded-xl text-white shadow-lg">
    <div class="flex flex-row flex-wrap w-full h-full gap-2 justify-around align-middle items-center">
      {@render Skills()}
    </div>
  </div>
  <Computer/>
</div>

{#snippet SocialMedia()}
    <div class="flex flex-row gap-6 h-fit mt-8 w-full justify-center items-center">
        <SquareButton icon={linkedin} onClick={()=>{goToSocialMedia("https://www.linkedin.com/in/jos%C3%A9-herbert-rodrigues-moreno-784274289/")}}/>
        <SquareButton icon={github} onClick={()=>{goToSocialMedia("https://github.com/Herbert-Moreno")}}/>
        <SquareButton icon={instagram} onClick={()=>{goToSocialMedia("https://www.instagram.com/herbert_xdr/")}}/>
    </div>
{/snippet}

{#snippet Skills()}
  <div class="w-fit h-full flex flex-row justify-around align-middle items-center gap-3">
    <div class="h-12 w-12 bg-[var(--Terciary-color)] text-white items-center align-middle justify-center flex rounded-xl">
      <Icon data={terminal} scale={2}/>
    </div>
    <p class="font-extrabold text-md">{text_localized["text"]["tools"]}</p>
  </div>
  <div class="w-fit h-full flex flex-row justify-around align-middle items-center gap-2">
    {#each ["c", "zig", "java", "golang", "svelte", "javascript", "git"] as skill}
      <SkillIcon icon={skill}/>
    {/each}
  </div>
{/snippet}