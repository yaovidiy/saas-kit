<script lang="ts">
	import type { Snippet } from 'svelte';

	let {
		message,
		type,
		content
	}: {
		message: string;
		type: 'success' | 'error' | 'warning' | 'info';
		content?: Snippet<[string]>;
	} = $props();

	const alertClasses = {
		success: 'alert-success',
		error: 'alert-error',
		warning: 'alert-warning',
		info: 'alert-info'
	};
</script>

<div class={`alert ${alertClasses[type]}`}>
	{#if content}
		{@render content(message)}
	{:else}
		<span>{message}</span>
	{/if}
</div>
