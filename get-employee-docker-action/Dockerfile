FROM node:20-alpine

COPY . .
RUN ls -al
RUN cd get-employee-js-action
RUN npm ci
ENTRYPOINT ["node", "/get-employee-js-action/main.js"]