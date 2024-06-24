<script lang="ts" generics="T">
	import type { Snippet } from 'svelte';

	let {
		headers,
		data,
		footers,
		modifiers,
		caption,
		headerCell,
		bodyCell,
		footerCell
	}: {
		headers: string[];
		data: T[][];
		footers?: string[];
		modifiers?: string;
		caption?: string;
		headerCell?: Snippet<[string]>;
		bodyCell?: Snippet<[T]>;
		footerCell?: Snippet<[string]>;
	} = $props();
</script>

<div class="overflow-x-auto">
	<table class={`table ${modifiers ?? ''}`}>
		{#if caption}
			<caption>{caption}</caption>
		{/if}
		<thead>
			<tr>
				{#each headers as header}
					{#if headerCell}
						{@render headerCell(header)}
					{:else}
						<th>{header}</th>
					{/if}
				{/each}
			</tr>
		</thead>
		<tbody>
			{#each data as row}
				<tr>
					{#each row as cell}
						{#if bodyCell}
							{@render bodyCell(cell)}
						{:else}
							<td>{cell}</td>
						{/if}
					{/each}
				</tr>
			{/each}
		</tbody>
		<tfoot>
			<tr>
				{#each footers ?? [] as footer}
					{#if footerCell}
						{@render footerCell(footer)}
					{:else}
						<th>{footer}</th>
					{/if}
				{/each}
			</tr>
		</tfoot>
	</table>
</div>
