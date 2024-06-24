<script lang="ts">
	import Button from '$lib/components/ui/Button/Button.svelte';
	import Input from '$lib/components/ui/Input/Input.svelte';
	import Dropdown from '$lib/components/ui/Dropdown/Dropdown.svelte';
	import Accordion from '$lib/components/ui/Accordion/Accordion.svelte';
	import Table from '$lib/components/ui/Table/Table.svelte';

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