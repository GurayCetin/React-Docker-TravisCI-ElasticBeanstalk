#build phase 
FROM node:alpine as builder

ENV http_proxy http://135.245.192.7:8000
ENV https_proxy http://135.245.192.7:8000

WORKDIR /app

COPY package.json . 
RUN npm install
COPY . .

RUN npm run build 

#run phase
FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html


