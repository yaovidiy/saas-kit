<script lang="ts">
	import type { Snippet } from 'svelte';
	let {
		children,
		type,
		extraClasses,
		onclick
	}: {
		children: Snippet;
		type: 'primary' | 'secondary' | 'ghost' | 'outline' | 'error' | 'success' | 'warning' | 'info';
		extraClasses?: string;
		onclick?: () => void;
	} = $props();

	const buttonTypes = {
		primary: 'btn-primary',
		secondary: 'btn-secondary',
		ghost: 'btn-ghost',
		outline: 'btn-outline',
		error: 'btn-error',
		success: 'btn-success',
		warning: 'btn-warning',
		info: 'btn-info'
	};

	let buttonClasses = `btn text-base font-bold ${buttonTypes[type]} min-h-[50px] md:max-w-[250px] w-full ${extraClasses}`;
</script>

<button {onclick} class={buttonClasses} type="button">
	{@render children()}
</button>
