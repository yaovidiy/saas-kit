<script lang="ts">
	import type { User } from '@prisma/client';
	import Table from '$lib/components/ui/Table/Table.svelte';
	import { capitalizeFirstLetter } from '$lib/utils/general';

	async function fetchUsers() {
		try {
			const resp = await fetch('/api/admin/get-users');

			if (!resp.ok) {
				throw new Error('Failed to fetch users');
			}

			const res = (await resp.json()) as User[];

			return res;
		} catch (error) {
			console.error(error);
		}
	}
</script>

{#await fetchUsers()}
	<p>Loading...</p>
{:then users}
	{#if users}
		<Table
			headers={[...Object.keys(users[0]).map((key) => capitalizeFirstLetter(key)), 'Actions']}
			data={users.map((user) => Object.entries(user).map(([_, value]) => value))}
		/>
	{/if}
{:catch error}
	<p class="text-red-500">{error.message}</p>
{/await}
