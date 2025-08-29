<script lang="ts">
	import '../app.css';
	import favicon from '$lib/assets/favicon.svg';
    import Header from '../components/Header.svelte';
	import { addressBook, briefcase, home } from 'svelte-awesome/icons';

	let { children } = $props();
</script>

<svelte:head>
	<link rel="icon" href={favicon} />
</svelte:head>

<Header children={[
	{icon:home, page:"landing"},
	{icon:briefcase, page:"projects"},
	{icon:addressBook, page:"curriculum"},
]}/>

{@render children?.()}

<style>
	@import url('https://fonts.googleapis.com/css2?family=Inter:ital,opsz,wght@0,14..32,100..900;1,14..32,100..900&display=swap');
	:root {
		overflow-y: hidden;
	}
</style>