#!/bin/bash
source /usr/local/rvm/scripts/rvm
rvm use 2.6.5
gem install bundler
cd /opt/redmine-4.1 && bundle install
bundle config set without 'development test rmagick'
bundle exec rake generate_secret_token
RAILS_ENV=production bundle exec rake db:migrate
RAILS_ENV=production REDMINE_LANG=ru bundle exec rake redmine:load_default_data
rake db:migrate
rake rails:update:bin
ruby bin/rails server -b 0.0.0.0 -e production