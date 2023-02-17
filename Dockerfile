FROM node:16

WORKDIR /linkr-server

COPY package*.json ./
COPY prisma ./prisma/


RUN npm install

COPY . .


CMD ["npm", "run", "docker"] 
