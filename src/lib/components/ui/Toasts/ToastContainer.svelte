<script lang="ts">
	import type { Snippet } from 'svelte';
	import ToastMessage from './ToastMessage.svelte';

	let {
		toasts
	}: {
		toasts: {
			message: string;
			type: 'success' | 'error' | 'warning' | 'info';
			content?: Snippet<[string]>;
		}[];
	} = $props();

	$effect(() => {
		const interval = setInterval(() => {
			toasts = toasts.slice(1);
		}, 5000);

		return () => clearInterval(interval);
	});
</script>

<div class="toast toast-end">
	{#each toasts as toast}
		<ToastMessage {...toast} />
	{/each}
</div>
