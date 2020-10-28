#!/bin/bash
sudo apt-add-repository -y ppa:rael-gc/rvm
sudo apt-get update
sudo apt-get install rvm
source /usr/local/rvm/scripts/rvm
rvm use 2.6.5
gem install bundler 
bundle config set without 'development test rmagick'
cd /opt/redmine-4.1 && bundle install
bundle config set without 'development test rmagick'
bundle exec rake generate_secret_token
RAILS_ENV=production bundle exec rake db:migrate
RAILS_ENV=production REDMINE_LANG=ru bundle exec rake redmine:load_default_data
