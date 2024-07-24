FROM node:20-alpine

COPY . ./src

RUN --mount=type=bind,source=/src \
  ls -al
RUN --mount=type=bind,source=/src/get-employee-js-action \
  npm ci

ENTRYPOINT ["node", "/src/get-employee-js-action/main.js"]