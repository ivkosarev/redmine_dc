#!/bin/bash
cd /opt && wget https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.6.tar.gz
tar -xvf ruby-2.6.6.tar.gz && cd ruby-2.6.6 && ./configure && make && make install
gem install bundler
cd /opt/redmine && bundle install
bundle config set without 'development test rmagick'
bundle exec rake generate_secret_token
RAILS_ENV=production bundle exec rake db:migrate --trace
RAILS_ENV=production REDMINE_LANG=ru bundle exec rake redmine:load_default_data