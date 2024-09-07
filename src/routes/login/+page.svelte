<!-- routes/login/+page.svelte -->
<script lang="ts">
	import Input from '$lib/components/ui/Input/Input.svelte';
	import Button from '$lib/components/ui/Button/Button.svelte';
	import { goto } from '$app/navigation';
	import { Github, Chrome } from 'lucide-svelte';
	import SuperDebug, { superForm } from 'sveltekit-superforms';
	import { dev } from '$app/environment';

	const { data } = $props();
	let errors = $state<Record<string, string[]>>({});
	const loginForm = superForm(data.loginForm, {
		onSubmit: (values) => {
			console.log(values, 'values');
		},
		onUpdate: ({ form }) => {
			if (!form.valid) {
				console.log(form.errors);
				errors = form.errors;
				return;
			}

			errors = {};
		}
	});

	$inspect(data);

	const { form, enhance } = loginForm;
</script>

{#if dev}
	<SuperDebug data={form} />
{/if}

<div class="card m-auto bg-base-200 shadow-xl md:max-w-96">
	<div class="card-body">
		<h1 class="card-title justify-center text-center text-4xl">Sign In</h1>
		<form class="flex flex-col gap-3 items-center" method="POST" use:enhance>
			<Input
				isError={errors?.email?.length > 0}
				errorMessage={errors?.email && errors?.email[0]}
				name="email"
				label="Username"
				extraClasses="max-w-xs"
				bind:value={$form.email}
				placeholder="Username"
				type="text"
			/>
			<Input
				isError={errors?.password?.length > 0}
				errorMessage={errors?.password && errors?.password[0]}
				label="Password"
				type="password"
				name="password"
				bind:value={$form.password}
				placeholder="Password"
			/>
			<Button buttonType="submit" type="primary" extraClasses="md:max-w-full">Login</Button>
		</form>

		<div class="flex flex-col mt-5 gap-5">
			<Button
				type="ghost"
				extraClasses="md:max-w-full"
				onclick={() => {
					goto('/signup');
				}}>Sign UP</Button
			>
			<Button
				type="ghost"
				extraClasses="md:max-w-full flex gap-2 items-center"
				onclick={() => {
					goto('/api/auth/github');
				}}
			>
				<Github size="24" />
				Sign in with GitHub
			</Button>
			<Button
				onclick={() => {
					goto('/api/auth/google');
				}}
				type="info"
				extraClasses="md:max-w-full flex gap-2 items-center"
			>
				<Chrome />
				Sign in with Google
			</Button>
		</div>
	</div>
</div>
