FROM node:lts-bullseye

USER root

RUN apt-get update && \
    apt-get install -y ffmpeg webp git && \
    apt-get upgrade -y && \
    rm -rf /var/lib/apt/lists/*

USER node

RUN git clone https://github.com/breshyb/base /home/node/base

WORKDIR /home/node/n

RUN chmod -R 777 /home/node/base/

RUN yarn install --network-concurrency 1

EXPOSE 7860

ENV NODE_ENV=production

CMD ["npm", "start"]

