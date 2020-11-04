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

RUN source /usr/local/rvm/scripts/rvm
RUN rvm use 2.6.5
RUN gem install bundler
RUN cd /opt/redmine-4.1 && bundle install
RUN bundle config set without 'development test rmagick'
RUN bundle exec rake generate_secret_token
RUN RAILS_ENV=production bundle exec rake db:migrate --trace
RUN RAILS_ENV=production REDMINE_LANG=ru bundle exec rake redmine:load_default_data


COPY ./init.sh /usr/local/bin/
RUN chmod a+x /usr/local/bin/init.sh 
ENTRYPOINT [ "/bin/bash", "-l", "-c" ]
CMD ["-c", "/usr/local/bin/init.sh"]

EXPOSE 3000
