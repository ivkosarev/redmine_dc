RAILS_ENV=production bundle exec rake db:migrate --trace
RAILS_ENV=production REDMINE_LANG=ru bundle exec rake redmine:load_default_data
ruby bin/rails server -b 0.0.0.0 -e production