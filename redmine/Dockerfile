FROM ubuntu

RUN apt-get update

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get install -y tzdata gnupg python-dev subversion\
imagemagick build-essential patch  lib1g-dev liblzma-dev\
libmagick++-dev passenger libcurl4-openssl-dev libssl-dev libpq-dev

RUN cd /opt && svn co https://svn.redmine.org/redmine/branches/4.1-stable redmine-4.1
RUN ln -s redmine-* redmine
COPY ./redmine/database.yml /opt/redmine-4.1/config/

COPY ./redmine/ruby.sh /usr/local/bin/
RUN chmod a+x /usr/local/bin/ruby.sh && bash /usr/local/bin/ruby.sh

EXPOSE 3000
