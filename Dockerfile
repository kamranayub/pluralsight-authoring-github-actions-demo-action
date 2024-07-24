FROM node:20-alpine

COPY . ./src

RUN --source=/src \
  ls -al
RUN --source=/src/get-employee-js-action \
  npm ci

ENTRYPOINT ["node", "/src/get-employee-js-action/main.js"]