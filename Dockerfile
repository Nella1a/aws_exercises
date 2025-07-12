FROM node:alpine

RUN mkdir -p /opt/aws-exercises
WORKDIR /opt/aws-exercises

COPY ./app/images ./images/
COPY ./app/index.html .
COPY ./app/package.json .
COPY ./app/server.js .
COPY ./app/server.test.js .

EXPOSE 3000

RUN npm install

CMD ["node", "server.js"]