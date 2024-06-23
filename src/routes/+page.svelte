<script lang="ts">
	import Button from '$lib/components/ui/Button/Button.svelte';
	import Input from '$lib/components/ui/Input/Input.svelte';

	const { data } = $props();
</script>

<fieldset class="flex flex-wrap gap-2 mb-10">
	<legend>Base buttons</legend>
	<Button type="primary">Primary</Button>
	<Button extraClasses="btn-secondary" type="">Secondary</Button>
	<Button type="ghost">Ghost</Button>
	<Button type="outline">Outline</Button>
	<Button extraClasses="btn-error" type="">Error</Button>
	<Button extraClasses="btn-success" type="">Success</Button>
	<Button extraClasses="btn-warning" type="">Warning</Button>
	<Button extraClasses="btn-info" type="">Info</Button>
</fieldset>

<fieldset>
	<legend>Base input</legend>
	<Input extraClasses="max-w-xs" value="" placeholder="Username" type="text" />
</fieldset>