<script lang="ts">
  import { T } from '@threlte/core';
  import { AnimatedSpriteMaterial, FakeGlowMaterial, MeshRefractionMaterial, useGltf, useTexture } from '@threlte/extras';

  let { fallback=()=>{}, error=()=>{}, children=()=>{}, ref = $bindable(), projectTexture, ...props } = $props();

  let laptop_screen_texture = $derived(projectTexture);
  
  const loadingPromise = Promise.all([
    useGltf(`${import.meta.env.BASE_URL}Computer.glb`),
    useTexture(`${import.meta.env.BASE_URL}ComputerTexture.png`)
  ]);
</script>


<T.Group
  bind:ref
  dispose={false}
  {...props}
>
  {#await loadingPromise}
    {@render fallback?.()}
  {:then [gltf, texture]}
  {texture.flipY = false}
  <T.AmbientLight intensity={0.8} />
  <T.DirectionalLight position={[5, 10, 7]} intensity={1.2} />
  <T.DirectionalLight position={[-5, 5, 5]} intensity={0.5} color="blue" />
  <T.DirectionalLight position={[0, -5, 5]} intensity={0.3} color="orange" />
  <!--Laptop-->
    <T.Mesh
      geometry={gltf.nodes.LaptopBase.geometry}
      position={[0.01, 0.88, -0.11]}
      rotation={[-0.34, 0, 0]}
    >
      <T.MeshToonMaterial map={texture} />
    </T.Mesh>
    <T.Mesh
      geometry={gltf.nodes.LaptopScreen.geometry}
      position={[0.01, 0.88, -0.11]}
      rotation={[-0.34, 0, 0]}
    >{#key laptop_screen_texture}
        <AnimatedSpriteMaterial
          textureUrl={projectTexture["url"] 
          ? `/${laptop_screen_texture["url"]}` 
          : ""}
          totalFrames={laptop_screen_texture["totalFrames"] 
          ? laptop_screen_texture["totalFrames"] 
          : 30}
          rows={laptop_screen_texture["rows"] 
          ? laptop_screen_texture["rows"] 
          : 6}
          columns={laptop_screen_texture["columns"] 
          ? laptop_screen_texture["columns"] 
          : 5}
        />
      {/key}
    </T.Mesh>
    <T.Mesh
      geometry={gltf.nodes.GlassStand.geometry}
      scale={1.69}
    >
      <T.MeshPhysicalMaterial 
        color="blue"
        transparent={true}
        opacity={0.5}
        roughness={0.02}
        metalness={0}
        clearcoat={1}
        clearcoatRoughness={0.2}
        envMapIntensity={1.5}
      />
    </T.Mesh>
    <T.Mesh
      geometry={gltf.nodes.Coffee.geometry}
      position={[2.39, 0.68, -0.16]}
      rotation={[-0.21, 0.83, -0.37]}
      scale={0.46}
    >
      <T.MeshToonMaterial color="brown"/>
    </T.Mesh>
    <T.Mesh
      geometry={gltf.nodes.Foam.geometry}
      position={[2.38, 0.65, -0.14]}
      rotation={[-0.3, 1.22, -0.39]}
      scale={0.31}
    >
      <T.MeshToonMaterial color="white"/>
    </T.Mesh>
    <T.Mesh
      geometry={gltf.nodes.Mug.geometry}
      position={[2.36, 0.58, -0.11]}
      rotation={[-0.21, 0.83, -0.37]}
      scale={0.46}
    >
      <T.MeshToonMaterial color="white"/>
    </T.Mesh>
    <T.Mesh
      geometry={gltf.nodes.Clock.geometry}
      position={[-2.44, 1.48, 0.99]}
      rotation={[0.37, -0.22, -0.05]}
      scale={1.14}
    >
      <T.MeshToonMaterial color="#2a2a2a" />
    </T.Mesh>
    <T.Mesh
      geometry={gltf.nodes.stars.geometry}
      position={[-0.41, -10, 5.34]}
      rotation={[1.53, 0, -0.3]}
      scale={[1.46, 1.18, 1.32]}
    >
      <T.MeshToonMaterial color="#ffffff" emissive="#ffffff" emissiveIntensity={0.3} /><T.MeshToonMaterial color="white"/>
    </T.Mesh>
    <T.Mesh
      geometry={gltf.nodes.bg2.geometry}
      position={[-12.15, 4.37, 17.44]}
      rotation={[0.11, 0.54, 1.46]}
      scale={[3.36, 2.67, 3.51]}
    >
      <T.MeshToonMaterial 
        color="yellow"
        emissive="yellow"
        emissiveIntensity={0.8}
      />
    </T.Mesh>
    <T.Mesh
      geometry={gltf.nodes.bg3.geometry}
      position={[2.51, 3.86, 19.38]}
      rotation={[1.21, 1.33, 0.09]}
      scale={[1.19, 0.95, 1.25]}
    >
      <T.MeshToonMaterial 
        color="blue"
        emissive="blue"
        emissiveIntensity={0.8}
      />
    </T.Mesh>
    <T.Mesh
      geometry={gltf.nodes.bg1.geometry}
      position={[2.51, 3.86, 19.38]}
      rotation={[1.21, 1.33, 0.09]}
      scale={[1.19, 0.95, 1.25]}
    >
      <T.MeshToonMaterial 
        color="pink"
        emissive="pink"
        emissiveIntensity={0.8}
      />
    </T.Mesh>
    <T.Mesh
      geometry={gltf.nodes.ClockHour.geometry}
      position={[-2.44, 1.48, 0.99]}
      rotation={[0.37, -0.22, -0.05]}
      scale={1.14}
    >
      <T.MeshToonMaterial color="white"/>
    </T.Mesh>
  {:catch err}
    {@render error?.({ error: err })}
  {/await}

  {@render children?.({ ref })}
</T.Group>