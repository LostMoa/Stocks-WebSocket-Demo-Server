# https://nodejs.org/de/docs/guides/nodejs-docker-webapp/

FROM node:slim

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

# If you are building your code for production
RUN npm ci --only=production

# Bundle app source
COPY . .

ENV NODE_ENV=production

EXPOSE 8080
CMD [ "node", "server.js" ]