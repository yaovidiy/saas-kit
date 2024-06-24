<script lang="ts">
	import Button from '$lib/components/ui/Button/Button.svelte';
	import Input from '$lib/components/ui/Input/Input.svelte';
	import Dropdown from '$lib/components/ui/Dropdown/Dropdown.svelte';
	import Accordion from '$lib/components/ui/Accordion/Accordion.svelte';
	import Carousel from '$lib/components/ui/Carousel/Carousel.svelte';

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
	const carouselItems = [
		{
			image: 'https://via.placeholder.com/300'
		},
		{
			image: 'https://via.placeholder.com/600'
		},
		{
			image: 'https://via.placeholder.com/900'
		}
	];
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

<Carousel {carouselItems}></Carousel>
