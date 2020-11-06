FROM ubuntu

RUN apt-get update

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get install -y tzdata gnupg python-dev git ruby-dev \
imagemagick build-essential patch liblzma-dev \
libmagick++-dev passenger libcurl4-openssl-dev libssl-dev libpq-dev

RUN cd /opt && git clone https://github.com/redmine/redmine.git
COPY ./database.yml /opt/redmine/config/
WORKDIR /opt/redmine
COPY ./ruby.sh /usr/local/bin/
RUN chmod a+x /usr/local/bin/ruby.sh && bash /usr/local/bin/ruby.sh

COPY ./init.sh /usr/local/bin/

EXPOSE 3000

ENTRYPOINT [ "/bin/bash", "-l", "-c" ]
CMD ["-c", "bash /usr/local/bin/init.sh"]


