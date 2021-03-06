# Setup and build the client
FROM node:alpine as client

ARG REACT_APP_RMK_URI
ARG REACT_APP_DAILYKEY
ARG REACT_APP_KEYCLOAK_URL
ARG REACT_APP_KEYCLOAK_REALM
ARG REACT_APP_KEYCLOAK_CLIENT_ID

WORKDIR /usr/src/app/client/
COPY client/package.json ./
RUN yarn
COPY client/ ./
RUN yarn build

ENV SKIP_PREFLIGHT_CHECK true
ENV REACT_APP_RMK_URI $REACT_APP_RMK_URI
ENV REACT_APP_DAILYKEY $REACT_APP_DAILYKEY
ENV REACT_APP_KEYCLOAK_URL $REACT_APP_KEYCLOAK_URL
ENV REACT_APP_KEYCLOAK_REALM $REACT_APP_KEYCLOAK_REALM
ENV REACT_APP_KEYCLOAK_CLIENT_ID $REACT_APP_KEYCLOAK_CLIENT_ID

# Setup the server
FROM node:alpine
WORKDIR /usr/src/app/
COPY --from=client /usr/src/app/client/build/ ./client/build/
WORKDIR /usr/src/app/server/
COPY server/package.json ./
RUN yarn
COPY server/ ./
CMD ["node", "index.js"]
