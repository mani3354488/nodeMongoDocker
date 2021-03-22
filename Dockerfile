FROM node:10

ENV MONGO_URL=mongodb://mongo:27017/test PORT=3000 WAIT_FOR=MONGO:27017

ADD https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh /wait-for-it
RUN chmod a+xr /wait-for-it

USER node

RUN mkdir -p /home/node/app

WORKDIR /home/node/app

COPY ["package.json", "package-lock.json*", "./"]
RUN npm install

COPY . .

EXPOSE 3000

CMD /wait-for-it ${WAIT_FOR} -- node server.js
