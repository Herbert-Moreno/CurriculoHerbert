# Usando a imagem oficial do Bun
FROM jarredsumner/bun:latest

# Pasta de trabalho
WORKDIR /app

# Copia package.json e bun.lockb
COPY package.json bun.lockb ./

# Instala dependências
RUN bun install

# Copia o restante do código
COPY . .

# Build SvelteKit
RUN bun run build

# Porta que o app vai usar
EXPOSE 3000

# Start
CMD ["bun", "run", "preview"]