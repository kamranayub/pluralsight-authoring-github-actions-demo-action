FROM node:20-alpine

# Copy the JavaScript action source code into the container
# The build context is the root of the repository
COPY ./get-employee-js-action/* ./action/

# Debug the file system layout
RUN cd action && \
  ls -al

# Install the dependencies
RUN cd action && \
  npm ci

# Run the action
ENTRYPOINT ["node", "/action/main.js"]