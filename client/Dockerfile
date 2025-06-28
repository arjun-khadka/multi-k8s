FROM node:18-alpine AS builder

WORKDIR /app

COPY ./package.json ./
RUN npm install

COPY . .

RUN npm run build

FROM nginx
EXPOSE 3000
COPY --from=builder /app/build /app/usr/share/nginx/html
COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf