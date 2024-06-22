<script lang="ts">
	import type { Snippet } from 'svelte';

	let {
		trigger,
		header,
		content,
		footer
	}: {
		trigger?: Snippet;
		header?: Snippet;
		content?: Snippet;
		footer?: Snippet;
	} = $props();

	let modal: HTMLDialogElement | null = null;
</script>

{#if trigger}
	{@render trigger()}
{:else}
	<button
		class="btn btn-primary"
		onclick={() => {
			modal?.showModal();
		}}>Open modal</button
	>
{/if}

<dialog bind:this={modal} class="modal">
	<div class="modal-box">
		<div class="modal-header">
			{#if header}
				{@render header()}
			{:else}
				<h2 class="text-xl">New modal</h2>
			{/if}
		</div>
		<div class="modal-content">
			{#if content}
				{@render content()}
			{:else}
				<p class="text-base">New modal base content</p>
			{/if}
		</div>
		<div class="modal-action">
			<form method="dialog">
				{#if footer}
					{@render footer()}
				{:else}
					<button class="btn btn-ghost">Close</button>
				{/if}
			</form>
		</div>
	</div>
</dialog>
