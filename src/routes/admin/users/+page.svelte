<script lang="ts">
	import { type User, Role } from '@prisma/client';
	import Table from '$lib/components/ui/Table/Table.svelte';
	import Button from '$lib/components/ui/Button/Button.svelte';
	import Input from '$lib/components/ui/Input/Input.svelte';
	import Select from '$lib/components/ui/Select/Select.svelte';
	import Modal from '$lib/components/Modal/Modal.svelte';
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
	<div class="skeleton h-5 mb-5 w-full"></div>
	<div class="skeleton h-5 mb-5 w-full"></div>
	<div class="skeleton h-5 mb-5 w-full"></div>
	<div class="skeleton h-5 mb-5 w-full"></div>
	<div class="skeleton h-5 mb-5 w-full"></div>
{:then users}
	{#if users}
		{@const headers = [...Object.keys(users[0]).map((key) => capitalizeFirstLetter(key)), 'Action']}
		{@const data = users.map((user) => [
			...Object.entries(user).map(([_, value]) => value?.toString() ?? 'N/A'),
			'Edit'
		])}
		{#snippet bodyCell(cell: string, rowIndex: number)}
			<td>
				{#if cell === 'Edit'}
					<Modal {trigger} header={modalHeader} content={modalContent} footer={modalFooter} />
				{:else}
					{cell}
				{/if}
			</td>
			{#snippet trigger(modal: HTMLDialogElement | null)}
				<Button onclick={() => modal?.showModal()} isOutlined type="primary">{cell}</Button>
			{/snippet}
			{#snippet modalHeader()}
				<h2 class="text-2xl text-center mb-3">Editing user: {users[rowIndex].username}</h2>
			{/snippet}
			{#snippet modalContent()}
				<div class="flex justify-center mb-10 items-center flex-col">
					<Input disabled type="text" label="Username" value={users[rowIndex].username} />
					<Input disabled type="text" label="Email" value={users[rowIndex].email} />
					<Select
						type="primary"
						size="md"
						label="Role"
						selectLabel="Select role"
						selectedValue={users[rowIndex].role}
						options={[
							{ value: Role.ADMIN, label: Role.ADMIN },
							{ value: Role.USER, label: Role.USER }
						]}
					/>
				</div>
			{/snippet}
			{#snippet modalFooter(modal: HTMLDialogElement | null)}
				<div class="flex flex-col md:flex-row px-5 justify-center items-center gap-3">
					<Button extraClasses="md:w-[50%]" onclick={() => console.log('Send')} type="primary">Update user</Button>
					<Button extraClasses="md:w-[50%]" onclick={() => modal?.close()} isOutlined type="primary">Close</Button>
				</div>
			{/snippet}
		{/snippet}
		<Table {headers} {data} {bodyCell} />
	{/if}
{:catch error}
	<p class="text-red-500">{error.message}</p>
{/await}
