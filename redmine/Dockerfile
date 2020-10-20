FROM ubuntu

RUN apt-get update

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get install -y subversion libcurl4-openssl-dev curl

RUN cd /opt && svn co https://svn.redmine.org/redmine/branches/4.1-stable redmine-4.1
RUN ln -s redmine-* redmine
RUN curl -sSL https://get.rvm.io | bash -s stable --ruby
COPY  COPY ./install_rvm /usr/local/bin/
CMD [ "ruby bin/rails server -b 0.0.0.0 -e production" ]
