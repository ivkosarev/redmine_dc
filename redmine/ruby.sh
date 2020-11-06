#!/bin/bash
gem install bundler
bundle install
bundle config set without 'development test rmagick'
bundle exec rake generate_secret_token