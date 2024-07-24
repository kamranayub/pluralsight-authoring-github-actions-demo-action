FROM node:20-alpine

COPY . ./src
RUN cd src && ls -al
RUN cd get-employee-js-action
RUN npm ci
ENTRYPOINT ["node", "main.js"]