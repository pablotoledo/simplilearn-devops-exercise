FROM ubuntu
RUN mkdir /code
WORKDIR /code
COPY angular-app /code
RUN apt update
RUN apt install curl -y
RUN curl -fsSL https://deb.nodesource.com/setup_10.x  -o node.sh
RUN sh node.sh
RUN rm node.sh
RUN apt-get update
RUN apt install nodejs -y
RUN npm install -g @angular/cli
RUN npm i -g npm
RUN npm install -g @angular/cli && npm cache clean --force
RUN npm i
EXPOSE 4200

CMD cd /code && ng serve --host 0.0.0.0
