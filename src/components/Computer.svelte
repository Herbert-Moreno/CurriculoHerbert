<script lang="ts">
  import { arrowLeft, arrowRight } from "svelte-awesome/icons";
  import SquareButton from "../components/SquareButton.svelte";
  import { text_localized } from "../lib/index";
    import ComputerModel from "./ComputerModel.svelte";
    import { Canvas, T } from "@threlte/core";
    import { OrbitControls } from "@threlte/extras";
  
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
</script>

<div class="w-full mt-24 max-w-5xl flex flex-row h-132 mb-4">
  <div class="bg-[#241075] rounded-xl text-white shadow-lg w-fit h-full pl-8 pr-8 flex flex-col flex-wrap justify-around items-center">
    {@render ProjectInfo()}
    {@render StackAndSkip()}
  </div>
  <div class="Background rounded-xl text-white shadow-lg w-full h-full ml-2 flex flex-col flex-wrap justify-around items-center">
    {@render ComputerScene()}
  </div>
</div>

{#snippet ComputerScene()}
  <Canvas>
    <T.PerspectiveCamera makeDefault position={[0, 1, -2]}>
      <OrbitControls enableDamping enablePan={false} enableZoom={false}/>
    </T.PerspectiveCamera>
    <ComputerModel projectTexture={projects_json["projects"][current_project]["texture"]} position={[0, 0.1, -0.95]} scale={0.2} rotation={[Math.PI/12, 0, 0]}/>
  </Canvas>
{/snippet}

{#snippet StackAndSkip()}
  <div class="w-full h-fit flex flex-row gap-3 items-center align-middle justify-center">
    <div class="w-full flex justify-start">
      <SquareButton icon_Scale={1.5} size={"2.8"} icon={arrowLeft} onClick={()=>{Change_Project("decrease")}}/>
    </div>
    <div class="w-fit h-fit flex justify-center items-center align-middle gap-1">
      {@render CreateStack()}
    </div>
    <div class="w-full flex justify-end">
      <SquareButton icon_Scale={1.5} size={"2.8"} icon={arrowRight} onClick={()=>{Change_Project("increase")}}/>
    </div>
  </div>
  {#snippet CreateStack()}
    {#each projects_json["projects"][current_project]["tech_stack"] as stack}
      <img 
      style="
      width: {32}px;
      height: {32}px;
      "
      src="https://skills.syvixor.com/api/icons?i={stack}" 
      alt="skill icons"
      />
    {/each}
  {/snippet}
{/snippet}

{#snippet ProjectInfo()}
  <section class="w-64 h-fit flex flex-col gap-3 pt-2">
    <div class="w-full flex flex-row justify-between text-bold items-end">
      <img class="w-14 h-14" src={projects_json["projects"][current_project]["icon_url"]} alt="Project Icon">
      <h1 class="text-white text-xl select-none font-extrabold">{projects_json["projects"][current_project]["name"]}</h1>
    </div>
    <p class="text-white text-md">Version: {projects_json["projects"][current_project]["version"]}</p>
    <p class="text-white text-md">
      {projects_json["projects"][current_project]["description"]}
    </p>
  </section>
  <br>
  <div class="w-full h-fit pb-2 text-end text-sm text-white/50">
    <a href={projects_json["projects"][current_project]["project_url"]}>
      {projects_json["text"]["project_link_text"]}
    </a>
  </div>
{/snippet}