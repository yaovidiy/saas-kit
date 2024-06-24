<script lang="ts">
	import Button from '$lib/components/ui/Button/Button.svelte';
	import Input from '$lib/components/ui/Input/Input.svelte';
	import Dropdown from '$lib/components/ui/Dropdown/Dropdown.svelte';
	import Accordion from '$lib/components/ui/Accordion/Accordion.svelte';
	import Table from '$lib/components/ui/Table/Table.svelte';
	import Alert from '$lib/components/ui/Alert/Alert.svelte';
	import ToastContainer from '$lib/components/ui/Toasts/ToastContainer.svelte';
	import Tooltip from '$lib/components/ui/Tooltip/Tooltip.svelte';

	const { data } = $props();
	const accordionItems = [
		{
			title: 'Item 1',
			content:
				'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam nec turpis eget dolor ultricies aliquam. Nullam nec turpis eget dolor ultricies aliquam.'
		},
		{
			title: 'Item 2',
			content:
				'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam nec turpis eget dolor ultricies aliquam. Nullam nec turpis eget dolor ultricies aliquam.'
		}
	];
	const headers: string[] = ['Header 1', 'Header 2', 'Header 3', 'Header 4', 'Header 5'];
	const columns: string[][] = [
		['Row 1 Column 1', 'Row 1 Column 2', 'Row 1 Column 3', 'Row 1 Column 4', 'Row 1 Column 5'],
		['Row 2 Column 1', 'Row 2 Column 2', 'Row 2 Column 3', 'Row 2 Column 4', 'Row 2 Column 5'],
		['Row 3 Column 1', 'Row 3 Column 2', 'Row 3 Column 3', 'Row 3 Column 4', 'Row 3 Column 5'],
		['Row 4 Column 1', 'Row 4 Column 2', 'Row 4 Column 3', 'Row 4 Column 4', 'Row 4 Column 5'],
		['Row 5 Column 1', 'Row 5 Column 2', 'Row 5 Column 3', 'Row 5 Column 4', 'Row 5 Column 5']
	];
	const footers: string[] = ['Footer 1', 'Footer 2', 'Footer 3', 'Footer 4', 'Footer 5'];

	let dummyToasts = $state<{ message: string; type: 'success' | 'error' | 'warning' | 'info' }[]>(
		[]
	);

	function addDummyToast() {
		dummyToasts = [
			...dummyToasts,
			{
				message: 'This is a dummy toast',
				type: 'success'
			}
		];
	}
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

<Dropdown>
	<ul class="menu bg-base-100 rounded-box z-[1] w-52 p-2 shadow">
		<li><a href="!#">Item 1</a></li>
		<li><a href="!#">Item 2</a></li>
	</ul>
</Dropdown>

<div class="mb-10 px-5">
	<Accordion {accordionItems}></Accordion>
</div>

<Table {headers} data={columns} {footers} caption="This is a table!">
	{#snippet bodyCell(cellValue)}
		<td>
			<div>
				<div class="font-bold">Heading</div>
				<div class="text-sm opacity-50">{cellValue}</div>
			</div>
		</td>
	{/snippet}
</Table>

<Alert alertType="error" alertText="Something whent wrong">
	{#snippet content(alertText)}
		<svg
			xmlns="http://www.w3.org/2000/svg"
			class="h-6 w-6 shrink-0 stroke-current"
			fill="none"
			viewBox="0 0 24 24"
		>
			<path
				stroke-linecap="round"
				stroke-linejoin="round"
				stroke-width="2"
				d="M10 14l2-2m0 0l2-2m-2 2l-2-2m2 2l2 2m7-2a9 9 0 11-18 0 9 9 0 0118 0z"
			/>
		</svg>
		<span>{alertText}</span>
	{/snippet}
</Alert>

<Alert alertType="info" alertText="Just an info for you"></Alert>

<Button type="primary" onclick={addDummyToast}>Add toast</Button>

<ToastContainer toasts={dummyToasts}></ToastContainer>

<Tooltip tooltip="Icon tooltip">
	{#snippet trigger()}
		<svg
			xmlns="http://www.w3.org/2000/svg"
			fill="none"
			viewBox="0 0 24 24"
			class="h-6 w-6 shrink-0 stroke-current cursor-pointer"
		>
			<path
				stroke-linecap="round"
				stroke-linejoin="round"
				stroke-width="2"
				d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"
			></path>
		</svg>
	{/snippet}
</Tooltip>

<article class="prose">
	<p>
		Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam nec turpis eget dolor ultricies
		aliquam. Nullam nec turpis eget dolor ultricies aliquam.
	</p>
	<p>
		Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam nec turpis eget dolor ultricies
		aliquam. Nullam nec turpis eget dolor ultricies aliquam.
	</p>

	<blockquote>
		<p>
			Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam nec turpis eget dolor
			ultricies aliquam. Nullam nec turpis eget dolor ultricies aliquam.
		</p>
	</blockquote>
	<h1>This is color!</h1>
</article>
