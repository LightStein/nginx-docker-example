FROM FROM node:lts-alpine
RUN apk --no-cache add --virtual native-deps \
  g++ gcc libgcc libstdc++ linux-headers make python && \
  npm install --quiet node-gyp -g &&\
  npm install --quiet && \
  apk del native-deps && \
  npm i -g http-server nuxt@^2.14.12
WORKDIR '/app'
COPY ./ .
RUN cd /app && \
  npm i && \
  npm rebuild node-sass && \
  npm run build
EXPOSE 3000
CMD ["npm", "start"]