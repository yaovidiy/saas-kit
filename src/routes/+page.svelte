<script lang="ts">
	import Modal from '$lib/components/Modal/Modal.svelte';
	import Login from '$lib/components/Auth/Login.svelte';
	const { data } = $props();
</script>

<Modal></Modal>

<Login></Login>

<h1 class="text-red-500">Welcome to SvelteKit</h1>
<p>Visit <a href="https://kit.svelte.dev">kit.svelte.dev</a> to read the documentation</p>
{data.username ?? ''}
