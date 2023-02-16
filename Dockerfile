FROM node:16

WORKDIR /linkr-server

COPY package*.json ./

RUN npm install

COPY . ./linkr-server


CMD ["npm", "run", "start"]