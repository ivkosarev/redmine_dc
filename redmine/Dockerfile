FROM ubuntu

RUN apt-get update

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get install -y subversion libcurl4-openssl-dev curl

RUN cd /opt && svn co https://svn.redmine.org/redmine/branches/4.1-stable redmine-4.1
RUN ln -s redmine-* redmine
RUN curl -sSL https://get.rvm.io | bash -s stable --ruby
RUN  ["/bin/bash", "-c", "source /usr/local/rvm/scripts/rvm"] 
RUN rvm install 2.6.5
RUN rvm use 2.6.5
RUN gem install bundler 
RUN bundle config set without 'development test rmagick'
RUN bundle exec rake generate_secret_token
RUN RAILS_ENV=production bundle exec rake db:migrate
RUN RAILS_ENV=production REDMINE_LANG=ru bundle exec rake redmine:load_default_data
