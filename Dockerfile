# Specify a base image for builder process
FROM node:alpine as builder

WORKDIR '/app'

# Install some depenendencies
COPY package.json .
RUN npm install
COPY ./ ./
RUN npm run build


# second phase for run. 
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html

# nginx container will start automatically. NO start needed