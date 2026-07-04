FROM oven/bun:1 AS base

WORKDIR /app

COPY bun.lock package.json ./
RUN bun install --ci --frozen-lockfile --production

COPY tsconfig.json ./
COPY src ./src

ENV HONEYPOT_DB_PATH=/data/honeypots.sqlite
RUN mkdir -p /data

CMD ["bun", "run", "src/bot.ts"]

