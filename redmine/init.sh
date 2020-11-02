#!/bin/bash
bundle config set without 'development test rmagick'
bundle exec rake generate_secret_token
RAILS_ENV=production bundle exec rake db:migrate
RAILS_ENV=production REDMINE_LANG=ru bundle exec rake redmine:load_default_data
heroku rake db:migrate 
rake rails:update:bin
ruby bin/rails server -b 0.0.0.0 -e production