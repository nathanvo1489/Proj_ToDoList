FROM node:24-alpine AS builder

WORKDIR /app

COPY package*.json ./
RUN npm install --omit=dev --no-audit --no-fund

COPY . .

FROM node:24-alpine

WORKDIR /app

ENV NODE_ENV=production

COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/package.json ./package.json

COPY server.js ./server.js
COPY controllers ./controllers
COPY middleware ./middleware
COPY models ./models
COPY routes ./routes
COPY scheduler ./scheduler

USER node
EXPOSE 8001

CMD ["node", "server.js"]

# docker build -t js_express_be_image .
# docker run --name js_express_be_container -d -p 8000:8001 --env-file=.env js_express_be_image