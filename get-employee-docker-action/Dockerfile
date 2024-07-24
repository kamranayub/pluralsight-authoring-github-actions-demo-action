FROM node:20-alpine

COPY ../get-employee-js-action ./src
RUN cd src && ls -al
RUN cd get-employee-js-action
RUN npm ci
ENTRYPOINT ["node", "main.js"]