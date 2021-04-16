FROM node:15

EXPOSE 3000

WORKDIR /var

RUN git clone https://github.com/simplicitesoftware/nodejs-demo.git

WORKDIR /var/nodejs-demo

RUN npm install

CMD [ "npm", "start"]
