# syntax = docker/dockerfile:1
# Adjust NODE_VERSION as desired
ARG NODE_VERSION=20.3.1
FROM node:${NODE_VERSION}-slim as base

LABEL fly_launch_runtime="Node.js/Prisma"

# Node.js/Prisma app lives here
WORKDIR /app

# Set production environment
ENV NODE_ENV="production"


# Throw-away build stage to reduce size of final image
FROM base as build

# Install packages needed to build node modules
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y build-essential node-gyp openssl pkg-config python-is-python3 ca-certificates \
    && rm -rf /var/lib/apt/lists /var/cache/apt/archives

# Install node modules
COPY --link package.json ./
RUN npm install --include=dev

# Generate Prisma Client
COPY --link prisma .

RUN npx prisma generate

# Copy application code
COPY --link . .

RUN npm run build

FROM base as dev

WORKDIR /app

# Install packages needed to build node modules
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y build-essential node-gyp openssl pkg-config python-is-python3 ca-certificates \
    && rm -rf /var/lib/apt/lists /var/cache/apt/archives

COPY --link package.json ./
COPY --link prisma ./

RUN npm instal --include=dev

COPY --link . .

# Start the server by default, this can be overwritten at runtime
EXPOSE 5173 5174
CMD [ "npm", "run", "dev" ]


# Final stage for app image
FROM base

WORKDIR /app

# Needed for Opentelemtry ESM
#ENV NODE_OPTIONS="--experimental-loader=@opentelemetry/instrumentation/hook.mjs"

# Install packages needed for deployment
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y openssl && \
    rm -rf /var/lib/apt/lists /var/cache/apt/archives

# Copy built application
COPY --from=build /app .

# Start the server by default, this can be overwritten at runtime
EXPOSE 3000
CMD [ "node", "build" ]
