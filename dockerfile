FROM node:14.1-alpine

LABEL version="1.0.0" description="API" maintainer="João Felipe<thecurrentuser@live.com>"

RUN apk add git

RUN cd ~ && mkdir -p /home/node/api/node_modules && chown -R node:node /home/node/api

WORKDIR /home/node/api

RUN git clone https://github.com/thecurrentuser/Maratona-Full-Cycle-2.0.git

RUN echo "Copiando os fontes e removendo arquivos desnecessários"
RUN mv Maratona-Full-Cycle-2.0/* .
RUN rm -rf Maratona-Full-Cycle-2.0

USER node
COPY --chown=node:node . .

RUN npm install

EXPOSE 3000

CMD ["npm", "run", "build"], ["npm", "start"] 