FROM perl:5.26

RUN apt-get update \
    && apt-get install -y cpanminus vim less \
    && cpanm Carton

COPY . /usr/src/app
WORKDIR /usr/src/app
ENTRYPOINT /usr/local/bin/perl

RUN cpanm --installdeps .

CMD [ "perl", "./main.pl" ]