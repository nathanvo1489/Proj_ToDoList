FROM node:24-alpine AS dependencies

WORKDIR /app

COPY package*.json ./
RUN npm install 
# --omit=dev --no-audit --no-fund

# build
COPY . .
# sẽ build vào folder dist
RUN npm run build

FROM node:24-alpine

WORKDIR /app

COPY --from=dependencies --chown=node:node /app/node_modules ./node_modules
COPY --chown=node:node . .

COPY --from=dependencies /app/dist ./dist
COPY --from=dependencies /app/node_modules ./node_modules

USER node
EXPOSE 8001

CMD ["node", "server.js"]

# docker build -t reactjs_image .
# docker run --name reactjs_container -d -p 8001:3000 --env-file=.env reactjs_image