FROM ubuntu

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y build-essential \
git \
gnupg \
imagemagick \
libcurl4-openssl-dev \
liblzma-dev \
libmagick++-dev \
libpq-dev \
libssl-dev \
patch \
python-dev \
ruby-dev \
tzdata \
&& rm -rf /var/lib/apt/lists/*

RUN cd /opt && git clone https://github.com/redmine/redmine.git

COPY ./database.yml /opt/redmine/config/

WORKDIR /opt/redmine

COPY ./ruby.sh /usr/local/bin/
RUN chmod a+x /usr/local/bin/ruby.sh && bash /usr/local/bin/ruby.sh

COPY ./init.sh /usr/local/bin/

EXPOSE 3000

ENTRYPOINT [ "/bin/bash", "-l", "-c" ]
CMD ["-c", "bash /usr/local/bin/init.sh"]



