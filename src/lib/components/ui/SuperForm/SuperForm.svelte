<script lang="ts" context="module">
	type T = Record<string, unknown>;
</script>

<script lang="ts">
	import { dev } from '$app/environment';
	import SuperDebug, { superForm } from 'sveltekit-superforms';
	import type { SuperValidated, ValidationErrors, SuperForm } from 'sveltekit-superforms';
	import type { Snippet } from 'svelte';

	let errors = $state<ValidationErrors<T>>({});

	let {
		data,
		superform = superForm(data, {
			onSubmit: (values) => {
				console.log(values, 'values');
			},
			onUpdate: ({ form }) => {
				if (!form.valid) {
					errors = form.errors;
					return;
				}

				errors = {};
			}
		}),
		children,
		action,
		formClasses
	}: {
		data: SuperValidated<T>;
		superform?: SuperForm<T>;
		children: Snippet<[SuperForm<T>, T, ValidationErrors<T>]>;
		action?: string;
		formClasses?: string;
	} = $props();

	const { form, enhance } = superform;
</script>

{#if dev}
	<SuperDebug data={form} />
{/if}

<form class={formClasses ?? ''} method="POST" {action} use:enhance>
	{#if children}
		{@render children(superform, $form, errors)}
	{/if}
</form>
