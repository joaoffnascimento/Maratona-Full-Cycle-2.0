#FROM node:12.14.0-alpine3.11

FROM node:14.1-alpine

LABEL version="1.1.0" description="API" maintainer="João Felipe<thecurrentuser@live.com>"

RUN apk add --no-cache git

RUN apk add --no-cache bash

RUN touch /root/.bashrc | echo "PS1='\w\$ '" >> /root/.bashrc

RUN npm i -g @nestjs/cli@6.14.2

RUN cd ~ && mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app

WORKDIR /home/node/app

RUN git clone -b desafio-02 https://github.com/thecurrentuser/Maratona-Full-Cycle-2.0.git

RUN echo "Copiando os fontes e removendo arquivos desnecessários"
RUN mv Maratona-Full-Cycle-2.0/* .
RUN rm -rf Maratona-Full-Cycle-2.0

USER node
COPY --chown=node:node . .

RUN npm install

EXPOSE 3000

ENTRYPOINT ["/.docker/entrypoint.sh"]
#CMD ["npm", "run", "init"]