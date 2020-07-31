FROM node:alpine as builder

WORKDIR /app
COPY package.json . 
RUN yarn install 
COPY . .

RUN yarn build

FROM nginx
COPY --from=builder /app/builc /usr/share/nginx/html

