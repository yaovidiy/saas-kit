import Stripe from 'stripe';
import { env } from "$env/dynamic/private";

let stripeInstance: Stripe;

export const getStripeInstance = (): Stripe => {
  if (!stripeInstance) {
    stripeInstance = new Stripe(env.STRIPE_SECRET_KEY, {
      // Add any additional configuration options here
    });
  }

  return stripeInstance;
};