#!/bin/bash
apt-get update
apt-add-repository -y ppa:rael-gc/rvm
apt-get update
apt-get install rvm -y
echo 'source "/etc/profile.d/rvm.sh"' >> ~/.bashrc
rvm install ruby
rvm use 2.6.5
gem install bundler 
bundle config set without 'development test rmagick'
cd /opt/redmine-4.1 && bundle install
bundle config set without 'development test rmagick'
bundle exec rake generate_secret_token
RAILS_ENV=production bundle exec rake db:migrate
RAILS_ENV=production REDMINE_LANG=ru bundle exec rake redmine:load_default_data
