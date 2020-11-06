FROM ubuntu

RUN apt-get update

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get install -y tzdata gnupg python-dev git ruby \
imagemagick build-essential patch liblzma-dev \
libmagick++-dev passenger libcurl4-openssl-dev libssl-dev libpq-dev

RUN cd /opt && git clone https://github.com/redmine/redmine.git
COPY ./database.yml /opt/redmine/config/

WORKDIR /opt/redmine

RUN gem install bundler && bundle install
RUN bundle config set without 'development test rmagick'
RUN bundle exec rake generate_secret_token
RUN RAILS_ENV=production bundle exec rake db:migrate --trace
RUN RAILS_ENV=production REDMINE_LANG=ru bundle exec rake redmine:load_default_data

#COPY ./ruby.sh /usr/local/bin/
#RUN chmod a+x /usr/local/bin/ruby.sh && bash /usr/local/bin/ruby.sh




EXPOSE 3000

ENTRYPOINT [ "/bin/bash", "-l", "-c" ]
CMD ["-c", "ruby bin/rails server -b 0.0.0.0 -e production"]


