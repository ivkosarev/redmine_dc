FROM ubuntu

RUN apt-get update

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get install -y tzdata gnupg python-dev git curl \
imagemagick build-essential patch liblzma-dev \
libmagick++-dev passenger libcurl4-openssl-dev libssl-dev libpq-dev

RUN cd /opt && git clone https://github.com/redmine/redmine.git
COPY ./database.yml /opt/redmine/config/

#COPY ./ruby.sh /usr/local/bin/
#RUN chmod a+x /usr/local/bin/ruby.sh && bash /usr/local/bin/ruby.sh



COPY ./install_r.sh /usr/local/bin/
RUN chmod a+x /usr/local/bin/install_r.sh 

WORKDIR /opt/redmine
EXPOSE 3000

ENTRYPOINT [ "/bin/bash", "-l", "-c" ]
CMD ["-c", "ruby bin/rails server -b 0.0.0.0 -e production"]


