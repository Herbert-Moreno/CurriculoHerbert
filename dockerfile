# Usando a imagem oficial do Bun
FROM oven/bun:1 AS base

# Pasta de trabalho
WORKDIR /usr/src/app

# Copia package.json e bun.lock
COPY package.json bun.lock ./

# Copia o restante do código
COPY . .

# Instala dependências
RUN bun install



# Build SvelteKit
RUN bun run build

# Porta que o app vai usar
EXPOSE 3000

# Start
CMD ["bun", "run", "preview"]