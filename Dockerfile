# Stage 1: Development and Testing
FROM node:20-alpine AS development
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run test

# Stage 2: Production Final Image
FROM node:20-alpine AS production
WORKDIR /app
COPY package*.json ./
RUN npm prune --production
COPY --from=development /app/server.js ./server.js

EXPOSE 3000
CMD ["node", "server.js"]
