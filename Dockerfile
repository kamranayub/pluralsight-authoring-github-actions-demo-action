FROM node:20-alpine

COPY . ./src

RUN cd src && \
  ls -al
RUN cd src/get-employee-js-action && \
  npm ci

ENTRYPOINT ["node", "/src/get-employee-js-action/main.js"]