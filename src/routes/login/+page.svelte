<!-- routes/login/+page.svelte -->
<script lang="ts">
	import { enhance } from '$app/forms';
	import Input from '$lib/components/ui/Input/Input.svelte';
	import Button from '$lib/components/ui/Button/Button.svelte';
</script>

<div class="card m-auto bg-base-200 shadow-xl md:max-w-96">
	<div class="card-body">
		<h1 class="card-title justify-center text-center text-4xl">Sign In</h1>
		<form class="flex flex-col gap-3 items-center" method="post" use:enhance>
			<Input label="Username" extraClasses="max-w-xs" value="" placeholder="Username" type="text" />
			<Input label="Password" type="password" value="" placeholder="Password" />
			<Button type="primary">Login</Button>
		</form>
		<a href="/signup">Sign Up</a>
		<a href="/login/github">Sign in with GitHub</a>
	</div>
</div>
