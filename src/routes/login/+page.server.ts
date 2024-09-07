// routes/login/+page.server.ts
import { redirect } from "@sveltejs/kit";
import type { Actions } from './$types.js';
import { superValidate, message } from 'sveltekit-superforms';
import { zod } from 'sveltekit-superforms/adapters';
import { fail } from '@sveltejs/kit';
import type { ServerLoadEvent } from "@sveltejs/kit";
import { loginSchema } from '$lib/schemas/loginSchema';

export async function load(event: ServerLoadEvent) {
  if (event.locals.user) {
    redirect(301, '/')
  }

  const loginForm = await superValidate(zod(loginSchema));

  return { loginForm };
}

export const actions = {
  default: async ({ request }) => {
    const formData = await request.formData();
    const loginFrom = await superValidate(formData, zod(loginSchema));


    if (!loginFrom.valid) return fail(400, { loginFrom });

    return message(loginFrom, { text: 'Form "login" posted successfully!' });
  }
} satisfies Actions;
