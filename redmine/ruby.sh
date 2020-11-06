#!/bin/bash
#gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
#curl -sSL https://get.rvm.io | bash
#source /usr/local/rvm/scripts/rvm
#rvm use 2.6.5
gem install bundler
bundle install
bundle config set without 'development test rmagick'
bundle exec rake generate_secret_token
RAILS_ENV=production bundle exec rake db:migrate --trace
RAILS_ENV=production REDMINE_LANG=ru bundle exec rake redmine:load_default_data
