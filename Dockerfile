FROM opensuse/leap

RUN zypper update -y && zypper install -y nano wget
RUN wget https://download.opensuse.org/repositories/openSUSE:/Factory/standard/noarch/yarn-1.22.10-2.1.noarch.rpm
RUN zypper install -y yarn-1.22.10-2.1.noarch.rpm 

RUN mkdir /skillbox
COPY package.json /skillbox
WORKDIR /skillbox
RUN yarn install

COPY . /skillbox
RUN yarn test
RUN yarn build

CMD yarn start

EXPOSE 3000
