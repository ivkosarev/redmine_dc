FROM ubuntu

RUN apt-get update

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get install -y tzdata gnupg python-dev subversion curl ruby \
imagemagick build-essential patch liblzma-dev \
libmagick++-dev passenger libcurl4-openssl-dev libssl-dev libpq-dev

RUN cd /opt && svn co https://svn.redmine.org/redmine/branches/4.1-stable redmine-4.1
RUN ln -s redmine-* redmine
COPY ./database.yml /opt/redmine-4.1/config/
#COPY ./Rakefile /opt/redmine-4.1/

COPY ./ruby.sh /usr/local/bin/
RUN chmod a+x /usr/local/bin/ruby.sh && bash /usr/local/bin/ruby.sh



COPY ./install_r.sh /usr/local/bin/
RUN chmod a+x /usr/local/bin/install_r.sh 
ENTRYPOINT [ "/bin/bash", "-l", "-c" ]
CMD ["-c", "rake rails:update:bin && ruby bin/rails server -b 0.0.0.0 -e production"]

EXPOSE 3000
