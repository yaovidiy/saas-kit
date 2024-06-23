<script lang="ts">
	import type { Snippet } from 'svelte';
	let {
		children,
		type,
		extraClasses,
		onclick
	}: {
		children: Snippet;
		type: string;
		extraClasses?: string;
		onclick?: () => void;
	} = $props();

	let buttonClasses = `btn text-base font-bold btn-${type} min-h-[50px] md:max-w-[250px] w-full ${extraClasses}`;
</script>

<button {onclick} class={buttonClasses} type="button">
	{@render children()}
</button>
