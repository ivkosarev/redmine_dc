FROM ubuntu

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y build-essential \
curl \
gnupg \
imagemagick \
libcurl4-openssl-dev \
liblzma-dev \
libmagick++-dev \
libpq-dev \
libssl-dev \
patch \
postgresql \
python-dev \
python3-pip \
ruby-dev \
subversion \
sudo \
tzdata \
zlib1g-dev \
&& rm -rf /var/lib/apt/lists/*

RUN cd /opt && svn co https://svn.redmine.org/redmine/branches/4.1-stable redmine-4.1 \
&& ln -s redmine-* redmine
COPY ./database.yml /opt/redmine/config/
WORKDIR /opt/redmine
COPY ./ruby.sh /usr/local/bin/
RUN chmod a+x /usr/local/bin/ruby.sh && bash /usr/local/bin/ruby.sh

COPY ./init.sh /usr/local/bin/

EXPOSE 3000

ENTRYPOINT [ "/bin/bash", "-l", "-c" ]
CMD ["-c", "bash /usr/local/bin/init.sh"]
