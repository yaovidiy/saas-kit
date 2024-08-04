<script lang="ts">
	import type { Snippet } from 'svelte';
	let {
		children,
		type,
		isOutlined,
		extraClasses,
		onclick
	}: {
		children: Snippet;
		type: 'primary' | 'secondary' | 'ghost' | 'error' | 'success' | 'warning' | 'info';
		isOutlined?: boolean;
		extraClasses?: string;
		onclick?: () => void;
	} = $props();

	const buttonTypes = {
		primary: 'btn-primary',
		secondary: 'btn-secondary',
		ghost: 'btn-ghost',
		error: 'btn-error',
		success: 'btn-success',
		warning: 'btn-warning',
		info: 'btn-info'
	};

	let buttonClasses = `btn text-base font-bold ${isOutlined ? 'btn-outline' : ''} ${buttonTypes[type]} min-h-[50px] md:max-w-[250px] w-full ${extraClasses}`;
</script>

<button {onclick} class={buttonClasses} type="button">
	{@render children()}
</button>
